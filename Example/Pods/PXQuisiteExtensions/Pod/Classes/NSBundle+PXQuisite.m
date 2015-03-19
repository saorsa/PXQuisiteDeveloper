/////////////////////////////////////////////////////////////////////////////////
//
//  NSBundle+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 4.02.15.
//
/////////////////////////////////////////////////////////////////////////////////
#import "NSBundle+PXQuisite.h"
#import "NSURL+PXQuisite.h"

@implementation NSBundle (PXQuisite)

- (NSDictionary *)dictionaryRepresentation {
    
    return @{
    
             @"bundleIdentifier": self.bundleIdentifier ?: [NSNull null],
             @"bundlePath": self.bundlePath ?: [NSNull null],
             @"bundleURL": [self.bundleURL dictionaryRepresentation] ?: [NSNull null],
             @"resourcePath": self.resourcePath ?: [NSNull null],
             @"resourceURL": [self.resourceURL dictionaryRepresentation] ?: [NSNull null],
             @"executablePath": self.executablePath ?: [NSNull null],
             @"executableArchitectures": self.executableArchitectures ?: [NSNull null],
             @"executableURL": [self.executableURL dictionaryRepresentation] ?: [NSNull null],
             @"privateFrameworksPath": self.privateFrameworksPath ?: [NSNull null],
             @"privateFrameworksURL": [self.privateFrameworksURL dictionaryRepresentation] ?: [NSNull null],
             @"sharedFrameworksPath": self.sharedFrameworksPath ?: [NSNull null],
             @"sharedFrameworksURL": [self.sharedFrameworksURL dictionaryRepresentation] ?: [NSNull null],
             @"sharedSupportPath": self.sharedSupportPath ?: [NSNull null],
             @"sharedSupportURL": [self.sharedSupportURL dictionaryRepresentation] ?: [NSNull null],
             @"builtInPlugInsPath": self.builtInPlugInsPath ?: [NSNull null],
             @"builtInPlugInsURL": [self.builtInPlugInsURL dictionaryRepresentation] ?: [NSNull null],
             @"appStoreReceiptURL": [self.appStoreReceiptURL dictionaryRepresentation] ?: [NSNull null],
    };
}

@end
