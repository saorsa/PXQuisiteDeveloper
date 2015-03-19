////////////////////////////////////////////////////////////////////////////
//
//  UIApplication+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 4.02.15.
//
////////////////////////////////////////////////////////////////////////////
#import "UIApplication+PXQuisite.h"

@implementation UIApplication (PXQuisite)

- (NSString *)bundleDisplayName {
    
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

- (NSString *)bundleIdentifier {
    
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)bundleExecutable {
    
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleExecutable"];
}

- (NSString *)bundleName {
    
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)bundleVersion {
    
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

@end
