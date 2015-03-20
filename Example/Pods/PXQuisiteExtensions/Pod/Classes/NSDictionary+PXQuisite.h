/////////////////////////////////////////////////////////////////////////////////
//
//  NSDictionary+PXQuisite.h
//  Pods
//
//  Created by Dragolov,Atanas on 1.02.15.
//
/////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

@interface NSDictionary (PXQuisite)

- (NSDictionary *)deepCopy;

- (NSMutableDictionary *)mutableDeepCopy;

- (NSString *)jsonify:(NSError *__autoreleasing*)error;

- (NSString *)jsonifyWithOptions:(NSJSONWritingOptions)options error:(NSError *__autoreleasing*)error;

@end
