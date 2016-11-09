//
//  UserDataProcessing.m
//  Notes
//
//  Created by Nikita Taranov on 11/9/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import "UserDataProcessing.h"

@implementation UserDataProcessing

+ (id)sharedManager {
    static UserDataProcessing *sharedDataProcessing = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataProcessing = [[self alloc] init];
    });
    return sharedDataProcessing;
}

-(void)saveData:(UserData *)userNote {

    if ([userNote.noteTitle length] == 0) {
        userNote.noteTitle = [[userNote.noteField componentsSeparatedByString:@" "] objectAtIndex:0];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:userNote.noteField forKey:userNote.noteTitle];
    
    [defaults synchronize];
 
}

-(NSDictionary*)readDataFromUserDefaults {
    
    NSString *userNotes = [[NSBundle mainBundle] bundleIdentifier];
    NSDictionary *dataDict = [[NSUserDefaults standardUserDefaults] persistentDomainForName:userNotes];

    return dataDict;
}

@end
