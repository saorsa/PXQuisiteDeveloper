//////////////////////////////////////////////////////////////////////////////////////////
//
//  NSDateFormatter+PXQuisite.h
//  Pods
//
//  Created by Dragolov,Atanas on 30.01.15.
//
//////////////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

@interface NSDateFormatter (PXQuisite)

/**
    Formatter in time zone [UTC] and 
    date format [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
 */
+ (NSDateFormatter *)UTCDateFormatter;

/**
    Formatter in the time zone of the device and 
    date format [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
 */
+ (NSDateFormatter *)localTimeZoneDateFormatter;

/**
    Formatter in the system time zone of the device and 
    date format [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
 */
+ (NSDateFormatter *)systemTimeZoneDateFormatter;

/**
    Formatter in the default time zone of the device and 
    date format [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
 */
+ (NSDateFormatter *)defaultTimeZoneDateFormatter;

@end
