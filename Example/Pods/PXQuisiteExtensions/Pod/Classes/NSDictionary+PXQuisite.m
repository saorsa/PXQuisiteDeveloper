/////////////////////////////////////////////////////////////////////////////////
//
//  NSDictionary+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 1.02.15.
//
/////////////////////////////////////////////////////////////////////////////////
#import "NSDictionary+PXQuisite.h"
#import "NSArray+PXQuisite.h"

@implementation NSDictionary (PXQuisite)

- (NSDictionary *)deepCopy {
    
    NSUInteger count = [self count];
    
    id cObjects[count];
    
    id cKeys[count];
    
    NSEnumerator *e = [self keyEnumerator];
    unsigned int i = 0;
    id thisKey;
    while ((thisKey = [e nextObject]) != nil) {
        id obj = [self objectForKey:thisKey];
        
        if ([obj respondsToSelector:@selector(deepCopy)])
            cObjects[i] = [obj deepCopy];
        else
            cObjects[i] = [obj copy];
        
        if ([thisKey respondsToSelector:@selector(deepCopy)])
            cKeys[i] = [thisKey deepCopy];
        else
            cKeys[i] = [thisKey copy];
        
        ++i;
    }
    
    NSDictionary *result = [NSDictionary dictionaryWithObjects:cObjects forKeys:cKeys count:count];
    
    return result;
}

- (NSMutableDictionary *)mutableDeepCopy {
    
    NSUInteger count = [self count];
    
    id cObjects[count];
    
    id cKeys[count];
    
    NSEnumerator *e = [self keyEnumerator];
    unsigned int i = 0;
    id thisKey;
    while ((thisKey = [e nextObject]) != nil) {
        id obj = [self objectForKey:thisKey];
        
        // Try to do a deep mutable copy, if this object supports it
        if ([obj respondsToSelector:@selector(mutableDeepCopy)])
            cObjects[i] = [obj mutableDeepCopy];
        
        // Then try a shallow mutable copy, if the object supports that
        else if ([obj respondsToSelector:@selector(mutableCopyWithZone:)])
            cObjects[i] = [obj mutableCopy];
        
        // Next try to do a deep copy
        else if ([obj respondsToSelector:@selector(deepCopy)])
            cObjects[i] = [obj deepCopy];
        
        // If all else fails, fall back to an ordinary copy
        else
            cObjects[i] = [obj copy];
        
        // I don't think mutable keys make much sense, so just do an ordinary copy
        if ([thisKey respondsToSelector:@selector(deepCopy)])
            cKeys[i] = [thisKey deepCopy];
        else
            cKeys[i] = [thisKey copy];
        
        ++i;
    }
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithObjects:cObjects forKeys:cKeys count:count];
    
    return result;
}

- (NSString *)jsonify:(NSError *__autoreleasing*)error {
    
    return [self jsonifyWithOptions:NSJSONWritingPrettyPrinted error:error];
}

- (NSString *)jsonifyWithOptions:(NSJSONWritingOptions)options error:(NSError *__autoreleasing*)error {
    
    NSError * serializeError = nil;
    
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self options:options error:&serializeError];
    
    if ( ! serializeError ) {
        
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        return jsonString;
    }
    else if ( error != NULL ) {
        
        *error = serializeError;
    }
    
    return nil;
}

@end
