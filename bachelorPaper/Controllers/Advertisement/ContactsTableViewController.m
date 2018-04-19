//
//  ContactsTableViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 19/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "LocalizationSystem.h"

@interface ContactsTableViewController ()

@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = AMLocalizedString(@"contacts", nil);

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:AMLocalizedString(@"next", nil) style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed:)];
    doneButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = doneButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];

 SimpleParameterCellIdentifier
 TextFieldParameterCellIdentifier
 AddPhoneCellIdentifier
 
    // Configure the cell...
    
    return cell;
}
*/

 - (void)nextButtonPressed:(UIButton *)sender {
 [self performSegueWithIdentifier:@"FinishCreationSegueIdentifier" sender:nil];
 }

@end
