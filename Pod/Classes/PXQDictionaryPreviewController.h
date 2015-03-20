///////////////////////////////////////////////////////////////////////////
//
//  PXQDictionaryPreviewController.h
//  Pods
//
//  Created by Dragolov,Atanas on 20.03.15.
//
///////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>

/**
    View controller used to display dictionary items information into a
    table view / list format.
 */
@interface PXQDictionaryPreviewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    
    @protected IBOutlet UITableView * _tableView;
    
    @protected IBOutlet UILabel * _noResultsLabel;
    
    @protected NSDictionary * _dataSourceItem;
    
    @protected NSArray * _dataSourceKeys;
}

@property (nonatomic, strong, readonly) UITableView * tableView;

@property (nonatomic, strong, readonly) UILabel * noResultsLabel;

@property (nonatomic, strong, readonly) NSDictionary * dataSourceItem;

@property (nonatomic, strong, readonly) NSArray * dataSourceKeys;

- (void)dataBind:(NSDictionary *)dictionary;

@end
