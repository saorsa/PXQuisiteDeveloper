/////////////////////////////////////////////////////////////////////
//
//  NSDateFormatter+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 30.01.15.
//
/////////////////////////////////////////////////////////////////////
#import "NSDateFormatter+PXQuisite.h"

@implementation NSDateFormatter (PXQuisite)

+ (NSDateFormatter *)UTCDateFormatter {
    
    static dispatch_once_t onceToken;
    
    static NSDateFormatter * __utcDateFormatter;
    
    dispatch_once(&onceToken, ^{
        
        __utcDateFormatter = [[NSDateFormatter alloc] init];
        
        [__utcDateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
        
        [__utcDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    });
    
    return __utcDateFormatter;
}

+ (NSDateFormatter *)localTimeZoneDateFormatter {
    
    static dispatch_once_t onceToken;
    
    static NSDateFormatter * __localTimeZoneFormatter;
    
    dispatch_once(&onceToken, ^{
        
        __localTimeZoneFormatter = [[NSDateFormatter alloc] init];
        
        [__localTimeZoneFormatter setTimeZone:[NSTimeZone localTimeZone]];
        
        [__localTimeZoneFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    });
    
    return __localTimeZoneFormatter;
}

+ (NSDateFormatter *)systemTimeZoneDateFormatter {
    
    static dispatch_once_t onceToken;
    
    static NSDateFormatter * __systemTimeZoneFormatter;
    
    dispatch_once(&onceToken, ^{
        
        __systemTimeZoneFormatter = [[NSDateFormatter alloc] init];
        
        [__systemTimeZoneFormatter setTimeZone:[NSTimeZone systemTimeZone]];
        
        [__systemTimeZoneFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    });
    
    return __systemTimeZoneFormatter;
}

+ (NSDateFormatter *)defaultTimeZoneDateFormatter {
    
    static dispatch_once_t onceToken;
    
    static NSDateFormatter * __defaultTimeZoneFormatter;
    
    dispatch_once(&onceToken, ^{
        
        __defaultTimeZoneFormatter = [[NSDateFormatter alloc] init];
        
        [__defaultTimeZoneFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
        
        [__defaultTimeZoneFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    });
    
    return __defaultTimeZoneFormatter;
}

@end
