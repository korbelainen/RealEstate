//
//  SavedSearchesInfoTableViewController.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/05/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SavedSearchesInfoTableViewController.h"
#import "TextFieldParameterTableViewCell.h"

@interface SavedSearchesInfoTableViewController () <UITableViewDelegate>

@end

@implementation SavedSearchesInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     if (self.isEditMode == true) {
         if (indexPath.row == 0) {
             TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchTitleCellIdentifier" forIndexPath: indexPath];
             cell.parameterTextfield.text = @"title";

             UIImageView *clearView = [[UIImageView alloc] init];
             clearView.image = [UIImage imageNamed:@"remove-photo"];
             [cell addSubview: clearView];
             return cell;
         } else {
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchNotificationFrequenceCellIdentifier" forIndexPath:indexPath];
             return cell;
         }
     } else {
         if (indexPath.row == 0) {
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedSearchesInfoCell" forIndexPath:indexPath];
             cell.textLabel.text = @"title";
             cell.detailTextLabel.text = @"";
             return cell;
         } else {
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedSearchesInfoCell" forIndexPath:indexPath];
             cell.textLabel.text = @"title";
             cell.detailTextLabel.text = @"subtitle";
             return cell;
         }
     }
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell.accessoryType == UITableViewCellAccessoryNone) {
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
             cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
}
@end
