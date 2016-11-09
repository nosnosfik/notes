//
//  NSMutableArray+Operations.h
//  CleveroadTeskTask
//
//  Created by Nikita Taranov on 11/8/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Operations)

- (void)swapObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex;
- (void)shellSortWithKey:(NSString *)key;

@end
