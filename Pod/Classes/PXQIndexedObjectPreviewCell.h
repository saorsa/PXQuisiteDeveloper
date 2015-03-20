///////////////////////////////////////////////////////////////////////////
//
//  PXQObjectPreviewCell.h
//  Pods
//
//  Created by Dragolov,Atanas on 20.03.15.
//
///////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>
#import "PXQObjectPreviewCell.h"

/**
    Table view cell used to render object information and index.
 */
@interface PXQIndexedObjectPreviewCell : PXQObjectPreviewCell {
    
    @protected IBOutlet UILabel * _indexLabel;
}

@property (nonatomic, strong, readonly) UILabel * indexLabel;

@end
