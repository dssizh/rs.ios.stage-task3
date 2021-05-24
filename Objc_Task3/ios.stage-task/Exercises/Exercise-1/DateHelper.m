#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSDictionary *monthsDictionary = [[NSDictionary alloc] initWithObjects:@[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"] forKeys:@[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12]];
    
    return [monthsDictionary objectForKey:[NSNumber numberWithLong:monthNumber]];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater dateFromString:date];
    [dateFormater setDateStyle:NSDateFormatterLongStyle];
    dateFormater.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [calendar component:NSCalendarUnitDay fromDate:[dateFormater dateFromString:date]];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDictionary *daysMap = [[NSDictionary alloc] initWithObjects:@[@"Вс", @"Пн", @"Вт", @"Ср", @"Чт", @"Пт", @"Сб"] forKeys:@[@1, @2, @3, @4, @5, @6, @7]];

    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [daysMap objectForKey:[NSNumber numberWithLong:[calendar component:NSCalendarUnitWeekday fromDate:date]]];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDate *currentDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger currentDay = [calendar component:NSCalendarUnitWeekday fromDate:currentDate];
    
    NSDate *startDate = [[NSDate alloc] initWithTimeIntervalSinceNow:-(currentDay-2)*24*60*60];
    NSDate *endDate = [[NSDate alloc] initWithTimeIntervalSinceNow:(7-(currentDay-1))*24*60*60];
    
    NSInteger day = [calendar component:NSCalendarUnitDay fromDate:date];
    
    if (day <= [calendar component:NSCalendarUnitDay fromDate:endDate] &&
        day >= [calendar component:NSCalendarUnitDay fromDate:startDate]) {
        return YES;
    }

    return NO;
}

@end
