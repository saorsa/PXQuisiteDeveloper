////////////////////////////////////////////////////////////////////////
//
//  NSBundle+PXQuisiteDeveloper.m
//  Pods
//
//  Created by Dragolov,Atanas on 20.03.15.
//
////////////////////////////////////////////////////////////////////////
#import "NSBundle+PXQuisiteDeveloper.h"

@implementation NSBundle (PXQuisiteDeveloper)

+ (instancetype)bundleForPXQuisiteDeveloper {
    
    static dispatch_once_t onceToken;
    
    static NSBundle * _pxqDeveloperBundle;
    
    dispatch_once(&onceToken, ^{
        
        NSString * bundlePath = [[NSBundle mainBundle] pathForResource:@"PXQuisiteDeveloper" ofType:@"bundle" inDirectory:nil];
        
        _pxqDeveloperBundle = [NSBundle bundleWithPath:bundlePath];
        
        if ( ! _pxqDeveloperBundle ) {
            
            [NSException raise:@"PXQNotFoundException" format:@"Failed to load the 'PXQuisiteDeveloper.bundle' at expected path '%@'", bundlePath];
        }
    });
    
    return _pxqDeveloperBundle;
}

@end
