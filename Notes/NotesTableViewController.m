//
//  NotesTableViewController.m
//  Notes
//
//  Created by Nikita Taranov on 11/8/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import "NotesTableViewController.h"
#import "NoteViewController.h"
#import "UserDataProcessing.h"

@interface NotesTableViewController ()

@property (strong,nonatomic) NSArray *dataArray;
@property (strong,nonatomic) NSString *segueTitleString;
@property (strong,nonatomic) NSString *segueDescriptionString;

@end

@implementation NotesTableViewController

#pragma mark - Table view data source

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView reloadData];
    
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"reload_data" object:nil];

    [self reloadData];

}

-(void)reloadData {
    
    UserDataProcessing *sharedManager = [UserDataProcessing sharedManager];

    self.dataArray = [sharedManager readDataFromUserDefaults];

    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteCell" forIndexPath:indexPath];
    
    UserData *userData = self.dataArray[indexPath.row];
    
    cell.textLabel.text = userData.noteTitle;

    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserData *userData = self.dataArray[indexPath.row];
    
    self.segueTitleString = userData.noteTitle;
    self.segueDescriptionString = userData.noteField;
    [self performSegueWithIdentifier:@"getNote" sender:self];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UserDataProcessing *sharedManager = [UserDataProcessing sharedManager];
        
        UserData *userData = self.dataArray[indexPath.row];
        
        [sharedManager deleteDataForKey:userData.noteTitle];
        
        [self reloadData];
    }
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"getNote"]) {

        NoteViewController *vc = [segue destinationViewController];

        vc.titleString = self.segueTitleString;
        vc.noteString = self.segueDescriptionString;
    }
}


@end
