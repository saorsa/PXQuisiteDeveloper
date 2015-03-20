///////////////////////////////////////////////////////////////////////////
//
//  PXQObjectPreviewCell.m
//  Pods
//
//  Created by Dragolov,Atanas on 20.03.15.
//
///////////////////////////////////////////////////////////////////////////
#import "PXQObjectPreviewCell.h"
#import <PXQuisiteExtensions/PXQuisiteExtensions.h>

@implementation PXQObjectPreviewCell

@synthesize classnameLabel = _classnameLabel;
@synthesize valueLabel = _valueLabel;

@synthesize dataItem = _dataItem;
@synthesize indexPath = _indexPath;

- (void)dataBind:(NSObject *)object forIndexPath:(NSIndexPath *)indexPath {
    
    _dataItem = object;
    
    _indexPath = indexPath;

    if ( object ) {
        
        _classnameLabel.text = NSStringFromClass(object.class);
        
        if ( [object isKindOfClass:[NSDictionary class]] ) {
            
            NSError * jsonifyError = nil;
            
            _valueLabel.text = [[((NSDictionary *)object) jsonify:&jsonifyError] stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
            
            if (jsonifyError) {
                
                _valueLabel.text = [jsonifyError description];
            }
        }
        else if ( [object isKindOfClass:[NSArray class]] ) {
            
            NSError * jsonifyError = nil;
            
            _valueLabel.text = [[((NSArray *)object) jsonify:&jsonifyError] stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
            
            if (jsonifyError) {
                
                _valueLabel.text = [jsonifyError description];
            }
        }
        else {
            
            _valueLabel.text = [object description];
        }
    }
    else {
        
        _classnameLabel.text = @"Null object reference";
        
        _valueLabel.text = @"";
    }
}

@end
