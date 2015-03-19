////////////////////////////////////////////////////////////////////////////
//
//  NSObject+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 30.01.15.
//
//
////////////////////////////////////////////////////////////////////////////
#import "NSObject+PXQuisite.h"

@implementation NSObject (PXQuisite)

+ (BOOL)isObjectNil:(NSObject *)object {

    return object == nil;
}

- (BOOL)isNull {
    
    BOOL result = self == [NSNull null];
    
    return result;
}

@end
