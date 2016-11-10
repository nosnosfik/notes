//
//  NSMutableArray+Operations.m
//  Notes
//
//  Created by Nikita Taranov on 11/8/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import "NSMutableArray+Operations.h"

@implementation NSMutableArray (Operations)

- (void)swapObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex{
    
    if (firstIndex && secondIndex > (self.count-1)) {
        NSLog(@"Index is out of range");
    } else [self exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
    
}

- (void)shellSortWithKey:(NSString *)key {
    
    NSUInteger count = [self count];
    
    for (NSInteger i = count / 2; i > 0; i = i / 2) {
        for (NSInteger j = i; j < count; j++) {
            for (NSInteger k = j - i; k >= 0; k = k - i) {
                if ([self[k + 1] valueForKey:key] >= [self[k] valueForKey:key]) {
                    break;
                }
                else {
                    [self exchangeObjectAtIndex:k withObjectAtIndex:(k + i)];
                }
            }
        }
    }
    
}

@end
