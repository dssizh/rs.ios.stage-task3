#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    if (tree.count == 0) {
        return @[];
    }
    
    if ([tree objectAtIndex:0] == [NSNull null]) {
        return @[];
    }
    
    if (tree.count == 1) {
        NSArray *array = [NSArray arrayWithObjects:[tree objectAtIndex:0], nil];
        [result addObject:array];
        return result;
    }
    
    NSLog(@"tree - %@", tree);
    int level = -1;
    for (int i=0; i<tree.count; i++) {

        if ([tree objectAtIndex:i] != [NSNull null]) {

            level++;
            NSMutableArray *array = [[NSMutableArray alloc] init];
            if (level >0 && level < result.count) {
                array = [result objectAtIndex:level];
                [array addObject:[tree objectAtIndex:i]];
                NSLog(@"array exist - %@", array);
            } else {

                [array addObject:[tree objectAtIndex:i]];
                [result addObject:array];
            }
            NSLog(@"result - %@", result);
        } else {
            if ([tree objectAtIndex:i+1] == [NSNull null]) {
                level = level -1;
            };
        }

    }

    return result;
}
