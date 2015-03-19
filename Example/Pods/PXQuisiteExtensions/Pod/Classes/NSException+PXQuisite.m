/////////////////////////////////////////////////////////////////////////////////
//
//  NSException+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 1.02.15.
//
/////////////////////////////////////////////////////////////////////////////////
#import "NSException+PXQuisite.h"
#import "NSError+PXQuisite.h"

NSString * const kNSException_PXQuisiteExtensionKeys_ErrorCodeKey = @"pxquisite.errorCode";

NSString * const kNSException_PXQuisiteExtensionKeys_ErrorInfoKey = @"pxquisite.errorInfo";

@implementation NSException (PXQuisite)

- (NSInteger)errorCode {
    
    NSNumber * errorCodeNumber = [self.userInfo objectForKey:kNSException_PXQuisiteExtensionKeys_ErrorCodeKey];
    
    if ( errorCodeNumber && [errorCodeNumber isKindOfClass:[NSNumber class]] ) {
        
        return errorCodeNumber.integerValue;
    }
    
    return NSNotFound;
}

- (NSDictionary *)errorInfo {
    
    NSDictionary * errorInfo = [self.userInfo objectForKey:kNSException_PXQuisiteExtensionKeys_ErrorCodeKey];
    
    if ( errorInfo && [errorInfo isKindOfClass:[NSDictionary class]] ) {
        
        return errorInfo;
    }
    
    return nil;
}

- (BOOL)isCreatedFromError {
    
    return self.errorInfo != nil;
}

+ (instancetype)exceptionWithException:(NSException *)exception errorCode:(NSInteger)errorCode {

    NSMutableDictionary * userInfoWithErrorCode =  [NSMutableDictionary dictionaryWithDictionary:exception.userInfo];
    
    [userInfoWithErrorCode setObject:@(errorCode) forKey:kNSException_PXQuisiteExtensionKeys_ErrorCodeKey];
    
    return [[[self class] alloc] initWithName:exception.name reason:exception.reason userInfo:userInfoWithErrorCode];
}

+ (instancetype)exceptionWithError:(NSError *)error {
 
    NSString * reason = error.localizedDescription ?: error.description;
    
    NSDictionary * errorUserInfo = error.dictionaryRepresentation;
    
    NSMutableDictionary * userInfo = [NSMutableDictionary dictionary];
    
    [userInfo setObject:(errorUserInfo?:[NSNull null]) forKey:kNSException_PXQuisiteExtensionKeys_ErrorInfoKey];
    
    [userInfo setObject:@(error.code) forKey:kNSException_PXQuisiteExtensionKeys_ErrorCodeKey];
   
    if ( [[error.domain lowercaseString] hasSuffix:@"exception"] ) {
        
        return [[[self class] alloc] initWithName:error.domain reason:reason userInfo:errorUserInfo];
    }
    else {
        
        return [[[self class] alloc] initWithName:[NSString stringWithFormat:@"%@Exception", error.domain] reason:reason userInfo:errorUserInfo];
    }
}

- (NSDictionary *)dictionaryRepresentation {
    
    return [NSDictionary dictionaryWithObjectsAndKeys:
            self.name ?: [NSNull null], @"name",
            self.reason ?: [NSNull null], @"reason",
            self.userInfo ?: [NSNull null], @"userInfo",
            self.callStackSymbols ?: [NSNull null], @"callStackSymbols",
            self.callStackReturnAddresses ?: [NSNull null], @"callStackReturnAddresses",
            nil];
}

@end
