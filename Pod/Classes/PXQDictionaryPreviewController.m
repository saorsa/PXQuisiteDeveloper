///////////////////////////////////////////////////////////////////////////
//
//  PXQDictionaryPreviewController.m
//  Pods
//
//  Created by Dragolov,Atanas on 20.03.15.
//
///////////////////////////////////////////////////////////////////////////
#import "PXQDictionaryPreviewController.h"
#import "PXQObjectPreviewCell.h"
#import "PXQIndexedObjectPreviewCell.h"
#import "NSBundle+PXQuisiteDeveloper.h"
#import <PXQuisiteExtensions/PXQuisiteExtensions.h>
#import <LINQ4Obj-C/LINQ.h>

@interface PXQDictionaryPreviewController ()

@property (nonatomic, strong, readonly) NSObject * dataBindLock;

@end

@implementation PXQDictionaryPreviewController

@synthesize tableView = _tableView;
@synthesize noResultsLabel = _noResultsLabel;
@synthesize dataSourceItem = _dataSourceItem;
@synthesize dataSourceKeys = _dataSourceKeys;

- (id)init {
    
    self = [self initWithNibName:NSStringFromClass(self.class) bundle:[NSBundle bundleForPXQuisiteDeveloper]];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    [self onInit];
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    [self onInit];
    
    return self;
}

- (void)onInit {
    
    _dataBindLock = [NSObject new];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if ( ! self.tableView ) {
        
        _tableView = [[UITableView alloc] init];
        
        _tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
        
        [_tableView applyAutoresizeAll];
    }
    
    if ( ! self.noResultsLabel ) {
        
        _noResultsLabel = [[UILabel alloc] init];
        
        _noResultsLabel.text = @"No items to display.";
        
        _noResultsLabel.backgroundColor = [UIColor whiteColor];
        
        _noResultsLabel.textAlignment = NSTextAlignmentCenter;
        
        _noResultsLabel.textColor = [UIColor blackColor];
        
        _noResultsLabel.frame = CGRectMake(15, 15, self.view.frame.size.width - 30, self.view.frame.size.height - 30);
        
        _noResultsLabel.alpha = 0;
        
        [self.view addSubview:_noResultsLabel];
        
        [_noResultsLabel applyAutoresizeAll];
    }
    
    UINib * genericCellNib = [UINib nibWithNibName:@"PXQObjectPreviewCell"
                                            bundle:[NSBundle bundleForPXQuisiteDeveloper]];
    
    [self.tableView registerNib:genericCellNib forCellReuseIdentifier:@"GenericCell"];

    UINib * genericIndexCellNib = [UINib nibWithNibName:@"PXQIndexedObjectPreviewCell"
                                                 bundle:[NSBundle bundleForPXQuisiteDeveloper]];
    
    [self.tableView registerNib:genericIndexCellNib forCellReuseIdentifier:@"GenericIndexedCell"];
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
}

- (void)dataBind:(NSDictionary *)dictionary {
    
    @synchronized ( self.dataBindLock ) {
        
        _dataSourceItem = dictionary;
        
        _dataSourceKeys = [_dataSourceItem.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
           
            if ( [obj1 isKindOfClass:[NSString class]] && [obj2 isKindOfClass:[NSString class]] ) {
                
                return [((NSString *)obj1) compare:((NSString *)obj2) options:NSCaseInsensitiveSearch];
            }
            
            if ( [obj1 isKindOfClass:[NSNumber class]] && [obj2 isKindOfClass:[NSNumber class]] ) {
                
                return [((NSNumber *)obj1) compare:((NSNumber *)obj2)];
            }
            
            return NSOrderedAscending;
        }];
    }
    
    [self reloadTableView];
}

- (void)reloadTableView {
    
    if ( ! [NSThread isMainThread] ) {
        
        [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:YES];
    }
    else {
        
        [_tableView reloadData];
        
        [_tableView setNeedsLayout];
        
        [_tableView setNeedsDisplay];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if ( self.dataSourceKeys.count > 0 ) {
        
        self.noResultsLabel.alpha = 0;
        
        self.tableView.alpha = 1;
    }
    else {
        
        self.noResultsLabel.alpha = 1;
        
        self.tableView.alpha = 0;
    }
    
    return self.dataSourceKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSObject * dataItemAtSection = [self dataItemAtSection:section];
    
    if ([dataItemAtSection isKindOfClass:[NSArray class]] ) {
        
        return ((NSArray *)dataItemAtSection).count;
    }
    
    return 1;
}

- (NSObject *)dataKeyAtSection:(NSUInteger)section {
    
    return [self.dataSourceKeys objectAtIndex:section];
}

- (NSObject *)dataItemAtSection:(NSUInteger)section {
    
    NSObject * key = [self dataKeyAtSection:section];
    
    return [self.dataSourceItem objectForKey:key];
}

- (NSObject *)dataItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSObject * master = [self dataItemAtSection:indexPath.section];
    
    if ( [master isKindOfClass:[NSArray class]] ) {
        
        return [((NSArray *)master) objectAtIndex:indexPath.row];
    }
    else {
        
        return master;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSObject * key = [self dataKeyAtSection:section];
    
    return [key description];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSObject * dataItem = [self dataItemAtIndexPath:indexPath];
    
    NSString * classname = NSStringFromClass(dataItem.class);
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:classname];
    
    if ( ! cell ) {
    
        NSObject * dataItemAtSection = [self dataItemAtSection:indexPath.section];
        
        NSString * genericIdentifier = [dataItemAtSection isKindOfClass:[NSArray class]] ? @"GenericIndexedCell" : @"GenericCell";
        
        cell = [tableView dequeueReusableCellWithIdentifier:genericIdentifier];
    }
    
    if ( [cell isKindOfClass:[PXQObjectPreviewCell class]] ) {
        
        [((PXQObjectPreviewCell *)cell) dataBind:dataItem forIndexPath:indexPath];
    }
    
    return cell;
}

@end
