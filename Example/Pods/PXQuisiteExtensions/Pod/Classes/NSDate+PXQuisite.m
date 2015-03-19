/////////////////////////////////////////////////////////////////////
//
//  NSDate+PXQuisite.m
//  Pods
//
//  Created by Dragolov,Atanas on 31.01.15.
//
/////////////////////////////////////////////////////////////////////
#import "NSDate+PXQuisite.h"
#import "NSDateFormatter+PXQuisite.h"

@implementation NSDate (PXQuisite)

- (NSString *)dateStringUsingFormatter:(NSDateFormatter *)dateFormatter {
    
    return [dateFormatter stringFromDate:self];
}

- (NSString *)dateStringUsingUTCFormatter {
    
    return [self dateStringUsingFormatter:[NSDateFormatter UTCDateFormatter]];
}

- (NSString *)dateStringUsingLocalTimeZoneFormatter {
    
    return [self dateStringUsingFormatter:[NSDateFormatter localTimeZoneDateFormatter]];
}

- (NSDate *)beginningOfDay {

    return [self beginningOfDayInTimeZone:[NSTimeZone localTimeZone]];
}

- (NSDate *)beginningOfDayInUTC {
    
    return [self beginningOfDayInTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
}

- (NSDate *)beginningOfDayInTimeZone:(NSTimeZone *)timeZone {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setTimeZone:timeZone];
    
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:self];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfDay {
    
    return [self endOfDayInTimeZone:[NSTimeZone localTimeZone]];
}

- (NSDate *)endOfDayInUTC {
    
    return [self endOfDayInTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
}

- (NSDate *)endOfDayInTimeZone:(NSTimeZone *)timeZone {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setTimeZone:timeZone];
    
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:self];
    
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    return [calendar dateFromComponents:components];
}

+ (NSDate *)convertedDate:(NSDate *)date inTimeZone:(NSTimeZone *)timeZone hours:(NSInteger)hours minutes:(NSInteger)minutes {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setTimeZone:timeZone];
    
    NSDateComponents *components = [calendar components:( NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:date];
    
    [components setHour:hours];
    
    [components setMinute:minutes];
    
    [components setSecond:0];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)convertedDateInTimeZone:(NSTimeZone *)timeZone hours:(NSInteger)hours minutes:(NSInteger)minutes; {
 
    return [[self class] convertedDate:self inTimeZone:timeZone hours:hours minutes:minutes];
}

@end
