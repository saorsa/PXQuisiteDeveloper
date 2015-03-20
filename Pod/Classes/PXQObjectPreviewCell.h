///////////////////////////////////////////////////////////////////////////
//
//  PXQObjectPreviewCell.h
//  Pods
//
//  Created by Dragolov,Atanas on 20.03.15.
//
///////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>

/**
    Table view cell used to render object information.
 */
@interface PXQObjectPreviewCell : UITableViewCell {
    
    @protected IBOutlet UILabel * _classnameLabel;
    
    @protected IBOutlet UILabel * _valueLabel;
}

@property (nonatomic, strong, readonly) NSIndexPath * indexPath;

@property (nonatomic, strong, readonly) NSObject * dataItem;

@property (nonatomic, strong, readonly) UILabel * classnameLabel;

@property (nonatomic, strong, readonly) UILabel * valueLabel;

- (void)dataBind:(NSObject *)object forIndexPath:(NSIndexPath *)indexPath;

@end
