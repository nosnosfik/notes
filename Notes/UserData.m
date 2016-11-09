//
//  UserData.m
//  Notes
//
//  Created by Nikita Taranov on 11/9/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import "UserData.h"

@implementation UserData

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.noteTitle = _noteTitle;
        self.noteField = _noteField;

    }
    return self;
}

@end
