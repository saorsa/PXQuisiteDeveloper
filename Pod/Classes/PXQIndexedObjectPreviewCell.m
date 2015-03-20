///////////////////////////////////////////////////////////////////////////
//
//  PXQObjectPreviewCell.m
//  Pods
//
//  Created by Dragolov,Atanas on 20.03.15.
//
///////////////////////////////////////////////////////////////////////////
#import "PXQIndexedObjectPreviewCell.h"

@implementation PXQIndexedObjectPreviewCell

@synthesize indexLabel = _indexLabel;
@synthesize classnameLabel = _classnameLabel;
@synthesize valueLabel = _valueLabel;

@synthesize dataItem = _dataItem;
@synthesize indexPath = _indexPath;

- (void)dataBind:(NSObject *)object forIndexPath:(NSIndexPath *)indexPath {
    
    _dataItem = object;
    
    _indexPath = indexPath;
    
    if ( indexPath ) {
        
        _indexLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    }
    else {
        
        _indexLabel.text = @"";
    }
    
    if ( object ) {
        
        _classnameLabel.text = NSStringFromClass(object.class);
        
        _valueLabel.text = [object description];
    }
    else {
        
        _classnameLabel.text = @"Null object reference";
        
        _valueLabel.text = @"";
    }
}

@end
