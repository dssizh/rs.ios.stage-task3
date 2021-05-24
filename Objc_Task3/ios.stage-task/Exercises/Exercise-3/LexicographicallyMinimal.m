#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    
    return [self getResultwithString1:string1 andString2:string2];
    
//    NSMutableString *result = [[NSMutableString alloc] init];
//
//    char ch1 = [string1 characterAtIndex:0];
//    char ch2 = [string2 characterAtIndex:0];
//
//    while (ch1 != 0||ch2 !=0) {
//        if (ch1 == 0 && ch2 != 0) {
//            [result appendString:[NSString stringWithFormat:@"%C", ch2]];
//            string2 = [string2 substringFromIndex:1];
//
//            NSLog(@"min - %C, max - %C", ch2, ch1);
//        } else if (ch2 == 0 && ch1 != 0) {
//            [result appendString:[NSString stringWithFormat:@"%C", ch1]];
//            string1 = [string1 substringFromIndex:1];
//
//            NSLog(@"min - %C, max - %C", ch1, ch2);
//        }else if (ch1 < ch2) {
//            [result appendString:[NSString stringWithFormat:@"%C", ch1]];
//            string1 = [string1 substringFromIndex:1];
//
//            NSLog(@"min - %C, max - %C", ch1, ch2);
//        } else if (ch1 == ch2) {
//            NSLog(@"equals");
//            NSComparisonResult comparisonResult = [string1 compare:string2];
//            if (comparisonResult == NSOrderedAscending) {
//                [result appendString:[NSString stringWithFormat:@"%C", ch1]];
//                string1 = [string1 substringFromIndex:1];
//
//                NSLog(@"min - %C, max - %C", ch1, ch2);
//            } else {
//                [result appendString:[NSString stringWithFormat:@"%C", ch2]];
//                string2 = [string2 substringFromIndex:1];
//
//                NSLog(@"min - %C, max - %C", ch2, ch1);
//            }
//        } else {
//            [result appendString:[NSString stringWithFormat:@"%C", ch2]];
//            string2 = [string2 substringFromIndex:1];
//
//            NSLog(@"min - %C, max - %C", ch2, ch1);
//        }
//
//        if (string1.length > 0) {
//            ch1 = [string1 characterAtIndex:0];
//        } else ch1 = 0;
//        if (string2.length > 0) {
//            ch2 = [string2 characterAtIndex:0];
//        } else ch2 = 0;
//    }
//
//    NSLog(@"result - %@", result);
//    return result;
}

-(NSString *) getResultwithString1:(NSString *) string1 andString2:(NSString *) string2 {
    
    NSMutableString *result = [[NSMutableString alloc] init];
    NSString *letter1 = @"";
    NSString *letter2 = @"";
    if (string1.length > 0) {
        letter1 = [string1 substringWithRange:NSMakeRange(0, 1)];
    }
    if (string2.length > 0) {
        letter2 = [string2 substringWithRange:NSMakeRange(0, 1)];
    }
    
    if (letter1.length == 0 && letter2.length ==0 ){
        return result;
    } else if (letter1.length == 0 && letter2.length != 0) {
        [result appendString:letter2];
        string2 = [string2 substringFromIndex:1];
    } else if (letter1.length != 0 && letter2.length == 0) {
        [result appendString:letter1];
        string1 = [string1 substringFromIndex:1];
    } else {
        NSComparisonResult comparisonResult = [letter1 compare:letter2];
        if (comparisonResult == NSOrderedAscending) {
            [result appendString:letter1];
            string1 = [string1 substringFromIndex:1];
        } else if (comparisonResult == NSOrderedSame) {
            NSComparisonResult comparisonResultString = [string1 compare:string2];
            if (comparisonResultString == NSOrderedAscending) {
                [result appendString:letter1];
                string1 = [string1 substringFromIndex:1];
            } else {
                [result appendString:letter2];
                string2 = [string2 substringFromIndex:1];
            }
        } else {
            [result appendString:letter2];
            string2 = [string2 substringFromIndex:1];
        }
    }
    [result appendString:[self getResultwithString1:string1 andString2:string2]];
    return result;
}


@end
