///////////////////////////////////////////////////////////////////////////
//
//  URSGenericListViewController.m
//  Pods
//
//  Created by Dragolov,Atanas on 18.03.15.
//
///////////////////////////////////////////////////////////////////////////
#import "URSArrayPreviewController.h"
#import <PXQuisiteExtensions/PXQuisiteExtensions.h>

@interface URSArrayPreviewController ()

@property (nonatomic, strong, readonly) NSObject * dataBindLock;

@end

@implementation URSArrayPreviewController

@synthesize tableView = _tableView;
@synthesize noResultsLabel = _noResultsLabel;
@synthesize dataSourceItems = _dataSourceItems;

- (id)init {
    
    self = [super init];
 
    [self onInit];
    
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
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
}

- (void)dataBind:(NSArray *)array {
    
    @synchronized ( self.dataBindLock ) {
        
        _dataSourceItems = array;
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
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ( self.dataSourceItems.count > 0 ) {
        
        self.noResultsLabel.alpha = 0;
        
        self.tableView.alpha = 1;
    }
    else {
        
        self.noResultsLabel.alpha = 1;
        
        self.tableView.alpha = 0;
    }
    
    return self.dataSourceItems.count;
}

- (NSObject *)dataItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.dataSourceItems objectAtIndex:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"reusableCell"];

    if ( ! cell ) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reusableCell"];
    }
    
    return cell;
}

@end
