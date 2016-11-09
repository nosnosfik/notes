//
//  UserDataProcessing.h
//  Notes
//
//  Created by Nikita Taranov on 11/9/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserDataProcessing : NSObject

+ (id)sharedManager;

-(void) saveDataFromTitleTextField:(UITextField*)textField andDataFromNote:(UITextView*)noteField;
-(NSDictionary*) readDataFromUserDefaults;


@end
