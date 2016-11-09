//
//  NoteViewController.m
//  Notes
//
//  Created by Nikita Taranov on 11/8/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import "NoteViewController.h"
#import "NotesTableView.h"
#import "PopUpViewController.h"

@interface NoteViewController ()

@end

@implementation NoteViewController

- (IBAction)noteSaveAction:(UIBarButtonItem *)sender {
    
    [self.titleTextField resignFirstResponder];
    [self.noteDescription resignFirstResponder];
    
    NSString *titleText = [self.titleTextField text];
    NSString *noteDescription  = [self.noteDescription text];
    
    if ([self.titleTextField.text length] < 1) {
        titleText = [[noteDescription componentsSeparatedByString:@" "] objectAtIndex:0];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:noteDescription forKey:titleText];
    [defaults synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reload_data" object:self];
    
    PopUpViewController *vc = [[PopUpViewController alloc] initWithNibName:@"PopUpViewController" bundle:nil];;
    [vc showInView:self.view animated:YES];
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleTextField.text = self.titleString;
    self.noteDescription.text = self.noteString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
