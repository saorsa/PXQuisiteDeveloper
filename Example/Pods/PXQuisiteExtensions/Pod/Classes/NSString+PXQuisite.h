////////////////////////////////////////////////////////////////////////////
//
//  NSString+PXQuisite.h
//  Pods
//
//  Created by Dragolov,Atanas on 30.01.15.
//
////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

@interface NSString (PXQuisite)

+ (NSString *)empty;

+ (BOOL)isNilOrEmpty:(NSString *)string;

- (BOOL)isEmptyString;

- (NSString *)trimmedString;

@end
