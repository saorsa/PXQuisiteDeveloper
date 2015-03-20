/////////////////////////////////////////////////////////////////////////////////
//
//  NSArray+PXQuisite.h
//  Pods
//
//  Created by Dragolov,Atanas on 1.02.15.
//
/////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

@interface NSArray (PXQuisite)

- (NSArray *)deepCopy;

- (NSMutableArray *)mutableDeepCopy;

- (NSString *)jsonify:(NSError *__autoreleasing*)error;

- (NSString *)jsonifyWithOptions:(NSJSONWritingOptions)options error:(NSError *__autoreleasing*)error;

@end
