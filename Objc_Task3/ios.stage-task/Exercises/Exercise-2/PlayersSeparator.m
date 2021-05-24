#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    if (ratingArray == nil) {
        return 0;
    }
    
    if (ratingArray.count < 3) {
        return 0;
    }
    
    int result = 0;
    for (int i = 0; i < ratingArray.count-2; i++) {
        for (int j = i+1; j < ratingArray.count-1; j++) {
            for (int k=j+1; k<ratingArray.count; k++){
                
                int x = [[ratingArray objectAtIndex:i] intValue];
                int y = [[ratingArray objectAtIndex:j] intValue];
                int z = [[ratingArray objectAtIndex:k] intValue];
                
                if ((x < y &&
                      y < z)
                    ||
                    (x > y && y > z)) {
                    result++;
                }
            }
        }
    }
        
    return result;
}

@end
