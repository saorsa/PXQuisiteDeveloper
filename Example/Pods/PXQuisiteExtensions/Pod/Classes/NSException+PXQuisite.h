/////////////////////////////////////////////////////////////////////////////////
//
//  NSException+PXQuisite.h
//  Pods
//
//  Created by Dragolov,Atanas on 1.02.15.
//
/////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

@interface NSException (PXQuisite)

/**
    Returns the associated error code for the exception, if any.
    Returns NSNotFound if the exception does not have an associated error code.
 
    This property is available to exceptions that have been created with one of
    the following methods
 
        + exceptionWithException:errorCode:
        + exceptionWithError:
 */
@property (readonly) NSInteger errorCode;

/**
    Returns the associated error reference user info, if any.
 
    This property is available to exceptions that have been created with one of
    the following methods:
 
            + exceptionWithError:
 */
@property (strong, readonly) NSDictionary * errorInfo;

/**
    Returns an indication, if the exception has been initialized using 
    the following methods:
 
            + exceptionWithError:
 */
@property (readonly) BOOL isCreatedFromError;

+ (instancetype)exceptionWithException:(NSException *)exception errorCode:(NSInteger)errorCode;

+ (instancetype)exceptionWithError:(NSError *)error;

- (NSDictionary *)dictionaryRepresentation;

@end
