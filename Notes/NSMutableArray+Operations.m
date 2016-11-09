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

- (void)shellSortWithKey:(NSString *)key{
    
    NSInteger gap,i;
    
    for (gap = self.count/2; gap > 0; gap /=2) {
        for (i = gap; i < self.count; i++) {
            if ([self[i] integerValue] < [self[i-gap] integerValue]) {
                NSInteger target = [self[i] integerValue];
                NSInteger j = i - gap;
                while (j >= 0 && [self[j] integerValue] > target) {
                    self[j+gap] = self[j];
                    j -= gap;
                }
                
                self[j+gap] = [NSNumber numberWithInteger:target];
            }
            
        }
        
    }
    
}

@end
