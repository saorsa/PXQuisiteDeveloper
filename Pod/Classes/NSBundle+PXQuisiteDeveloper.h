////////////////////////////////////////////////////////////////////////
//
//  NSBundle+PXQuisiteDeveloper.h
//  Pods
//
//  Created by Dragolov,Atanas on 20.03.15.
//
////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

/**
    Extension methods for the NSBundle class.
    Allows flexibility and easiness when retrieving and managing
    PXQuisiteDeveloper bundles and resources.
 */
@interface NSBundle (PXQuisiteDeveloper)

/**
    Singleton access to the PXQuisiteDeveloper.bundle.
 */
+ (instancetype)bundleForPXQuisiteDeveloper;

@end
