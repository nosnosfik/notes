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

-(void)saveDataFromTitleTextField:(UITextField *)textField andDataFromNote:(UITextView *)noteField{
    
    NSString *titleText = [textField text];
    NSString *noteDescription  = [noteField text];
    
    if ([textField.text length] < 1) {
        titleText = [[noteDescription componentsSeparatedByString:@" "] objectAtIndex:0];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:noteDescription forKey:titleText];
    
    [defaults synchronize];
    
}

-(NSDictionary*)readDataFromUserDefaults {
    
    NSString *userNotes = [[NSBundle mainBundle] bundleIdentifier];
    NSDictionary *dataDict = [[NSUserDefaults standardUserDefaults] persistentDomainForName:userNotes];

    return dataDict;
}

@end
