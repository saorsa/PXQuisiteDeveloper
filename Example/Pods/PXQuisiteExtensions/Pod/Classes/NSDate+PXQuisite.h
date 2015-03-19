/////////////////////////////////////////////////////////////////////
//
//  NSDate+PXQuisiteExtensions.h
//  Pods
//
//  Created by Dragolov,Atanas on 31.01.15.
//
/////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

@interface NSDate (PXQuisite)

+ (NSDate *)convertedDate:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone hours:(NSInteger)hours minutes:(NSInteger)minutes;

- (NSDate *)convertedDateInTimeZone:(NSTimeZone *)timeZone hours:(NSInteger)hours minutes:(NSInteger)minutes;

- (NSString *)dateStringUsingFormatter:(NSDateFormatter *)dateFormatter;

- (NSString *)dateStringUsingUTCFormatter;

- (NSString *)dateStringUsingLocalTimeZoneFormatter;

- (NSDate *)beginningOfDay;

- (NSDate *)beginningOfDayInUTC;

- (NSDate *)beginningOfDayInTimeZone:(NSTimeZone *)timeZone;

- (NSDate *)endOfDay;

- (NSDate *)endOfDayInUTC;

- (NSDate *)endOfDayInTimeZone:(NSTimeZone *)timeZone;

@end
