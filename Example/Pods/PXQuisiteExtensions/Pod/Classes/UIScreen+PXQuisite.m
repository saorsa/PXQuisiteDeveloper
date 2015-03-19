////////////////////////////////////////////////////////////////////////////
//
//  UIScreen+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 4.02.15.
//
////////////////////////////////////////////////////////////////////////////
#import "UIScreen+PXQuisite.h"
#import "UIScreenMode+PXQuisite.h"

@implementation UIScreen (PXQuisite)

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableArray * availableModesRepresentation = [NSMutableArray new];
    
    for ( UIScreenMode * screenMode in self.availableModes) {
     
        [availableModesRepresentation addObject:([screenMode dictionaryRepresentation] ?: [NSNull null])];
    }
    
    return @ {
        
        @"applicationFrame": NSStringFromCGRect(self.applicationFrame),
        @"scale" : @(self.scale),
        @"availableModes": availableModesRepresentation,
        @"preferredMode" : [self.preferredMode dictionaryRepresentation] ?: [NSNull null],
        @"currentMode" : [self.currentMode dictionaryRepresentation] ?: [NSNull null],
        @"brightness" : @(self.brightness),
        @"wantsSoftwareDimming" : @(self.wantsSoftwareDimming),
        @"nativeBounds" : NSStringFromCGRect(self.nativeBounds),
        @"nativeScale" : @(self.nativeScale),
    };
}

@end
