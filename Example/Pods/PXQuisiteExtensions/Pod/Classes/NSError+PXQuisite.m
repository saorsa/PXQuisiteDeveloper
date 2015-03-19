/////////////////////////////////////////////////////////////////////////////////
//
//  NSError+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 1.02.15.
//
/////////////////////////////////////////////////////////////////////////////////
#import "NSError+PXQuisite.h"
#import "NSException+PXQuisite.h"

NSString * const kNSError_PXQuisiteExtensionKeys_ExceptionInfoKey = @"pxquisite.exceptionInfo";

@implementation NSError (PXQuisite)

+ (instancetype)errorFromException:(NSException *)exception {
    
    NSInteger exceptionCode = exception.errorCode;
    
    NSMutableDictionary * extendedInfo = [NSMutableDictionary dictionaryWithDictionary:exception.userInfo];
    
    NSDictionary * exceptionInfo = [exception dictionaryRepresentation];
    
    [extendedInfo setObject:exceptionInfo forKey:kNSError_PXQuisiteExtensionKeys_ExceptionInfoKey];

    return [[[self class] alloc] initWithDomain:exception.name code:(exceptionCode != NSNotFound ? exceptionCode : 0) userInfo:extendedInfo];
}

- (NSDictionary *)dictionaryRepresentation {

    return [NSDictionary dictionaryWithObjectsAndKeys:
            self.domain ?: [NSNull null], @"domain",
            @(self.code), @"code",
            self.userInfo ?: [NSNull null], @"userInfo",
            nil];
}

@end
