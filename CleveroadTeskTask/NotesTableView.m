//
//  NotesTableView.m
//  CleveroadTeskTask
//
//  Created by Nikita Taranov on 11/8/16.
//  Copyright © 2016 Nikita Taranov. All rights reserved.
//

#import "NotesTableView.h"
#import "NoteViewController.h"

@interface NotesTableView ()

@property (strong,nonatomic) NSDictionary *dataDict;
@property (strong,nonatomic) NSString *segueTitleString;
@property (strong,nonatomic) NSString *segueDescriptionString;

@end

@implementation NotesTableView

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

-(void)reloadData{
    
    NSString *userNotes = [[NSBundle mainBundle] bundleIdentifier];

    self.dataDict = [[NSUserDefaults standardUserDefaults] persistentDomainForName:userNotes];

    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataDict count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noteCell" forIndexPath:indexPath];
    
    NSString *key = [self.dataDict allKeys][indexPath.row];

    cell.textLabel.text = key;

    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.segueTitleString = [self.dataDict allKeys][indexPath.row];
    self.segueDescriptionString = [self.dataDict allValues][indexPath.row];
    [self performSegueWithIdentifier:@"getNote" sender:self];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:[self.dataDict allKeys][indexPath.row]];
        
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
