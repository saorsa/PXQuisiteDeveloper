///////////////////////////////////////////////////////////////////////////
//
//  URSGenericListViewController.h
//  Pods
//
//  Created by Dragolov,Atanas on 18.03.15.
//
///////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>

@interface URSArrayPreviewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
 
    @protected IBOutlet UITableView * _tableView;
    
    @protected IBOutlet UILabel * _noResultsLabel;
    
    @protected NSArray * _dataSourceItems;
}

@property (nonatomic, strong, readonly) UITableView * tableView;

@property (nonatomic, strong, readonly) UILabel * noResultsLabel;

@property (nonatomic, strong, readonly) NSArray * dataSourceItems;

- (void)dataBind:(NSArray *)array;

@end
