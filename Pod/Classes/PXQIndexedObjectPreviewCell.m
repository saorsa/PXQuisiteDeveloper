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

- (void)dataBind:(NSObject *)object forIndexPath:(NSIndexPath *)indexPath {
    
    [super dataBind:object forIndexPath:indexPath];
    
    if ( indexPath ) {
        
        _indexLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    }
    else {
        
        _indexLabel.text = @"";
    }
}

@end
