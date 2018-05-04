//
//  ContactsTableViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 19/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "LocalizationSystem.h"
#import "TextFieldParameterTableViewCell.h"
#import "ParameterWithActionTableViewCell.h"

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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    } else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
       TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldParameterCellIdentifier" forIndexPath:indexPath];
        return cell;
    } else {
        if (indexPath.row == 0) {
            TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextFieldParameterCellIdentifier" forIndexPath:indexPath];
            return cell;
        } else {
        ParameterWithActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddPhoneCellIdentifier" forIndexPath:indexPath];
        [cell.actionButton setTitle:AMLocalizedString(@"add_phone", nil) forState:UIControlStateNormal];
        return cell;
        }
    }
}

 - (void)nextButtonPressed:(UIButton *)sender {
 [self performSegueWithIdentifier:@"FinishCreationSegueIdentifier" sender:nil];
 }

@end
