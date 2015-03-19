////////////////////////////////////////////////////////////////////////////
//
//  NSString+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 30.01.15.
//
////////////////////////////////////////////////////////////////////////////
#import "NSString+PXQuisite.h"
#import "NSObject+PXQuisite.h"

NSString * const kNSString_PXQuisite_EmptyString = @"";

@implementation NSString (PXQuisite)

+ (BOOL)isNilOrEmpty:(NSString *)string {
    
    return [NSObject isObjectNil:string] || string.isEmptyString;
}

+ (NSString *)empty {
    
    return kNSString_PXQuisite_EmptyString;
}

- (BOOL)isEmptyString {

    return self.length == 0;
}

- (NSString *)trimmedString {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
