////////////////////////////////////////////////////////////////////////////
//
//  UIScreenMode+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 4.02.15.
//
////////////////////////////////////////////////////////////////////////////
#import "UIScreenMode+PXQuisite.h"

@implementation UIScreenMode (PXQuisite)

- (NSDictionary *)dictionaryRepresentation {
    
    return @{
      
             @"size" : NSStringFromCGSize(self.size),
             @"pixelAspectRatio" : @(self.pixelAspectRatio)
    };
}

@end
