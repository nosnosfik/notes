//
//  NoteViewController.m
//  Notes
//
//  Created by Nikita Taranov on 11/8/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import "NoteViewController.h"
#import "NotesTableViewController.h"
#import "PopUpViewController.h"
#import "UserDataProcessing.h"

@interface NoteViewController ()

@end

@implementation NoteViewController

- (IBAction)noteSaveAction:(UIBarButtonItem *)sender {
    
    [self.titleTextField resignFirstResponder];
    [self.noteDescription resignFirstResponder];
    
    UserDataProcessing *sharedManager = [UserDataProcessing sharedManager];
    
    [sharedManager saveDataFromTitleTextField:self.titleTextField andDataFromNote:self.noteDescription];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"reload_data" object:self];
    
    PopUpViewController *vc = [[PopUpViewController alloc] initWithNibName:@"PopUpViewController" bundle:nil];;
    
    [vc showInView:self.view animated:YES];
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleTextField.text = self.titleString;
    self.noteDescription.text = self.noteString;
}


@end
