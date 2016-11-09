//
//  NoteViewController.h
//  CleveroadTeskTask
//
//  Created by Nikita Taranov on 11/8/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *noteDescription;

@property (strong,nonatomic) NSString *titleString;
@property (strong,nonatomic) NSString *noteString;

- (IBAction)noteSaveAction:(UIBarButtonItem *)sender;

@end
