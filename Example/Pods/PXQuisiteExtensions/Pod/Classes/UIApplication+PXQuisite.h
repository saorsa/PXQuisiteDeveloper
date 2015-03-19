////////////////////////////////////////////////////////////////////////////
//
//  UIApplication+PXQuisite.h
//  Pods
//
//  Created by Dragolov,Atanas on 4.02.15.
//
//
////////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>

@interface UIApplication (PXQuisite)

@property (nonatomic, readonly, strong) NSString * bundleDisplayName;

@property (nonatomic, readonly, strong) NSString * bundleIdentifier;

@property (nonatomic, readonly, strong) NSString * bundleExecutable;

@property (nonatomic, readonly, strong) NSString * bundleName;

@property (nonatomic, readonly, strong) NSString * bundleVersion;

@end
