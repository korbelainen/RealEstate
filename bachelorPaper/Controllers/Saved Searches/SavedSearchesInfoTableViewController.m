//
//  SavedSearchesInfoTableViewController.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/05/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SavedSearchesInfoTableViewController.h"

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
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedSearchesInfoCell" forIndexPath:indexPath];
//     if (indexPath.row == 0) {
         cell.textLabel.text = @"title";
         cell.detailTextLabel.text = @"subtitle";
//     }
 return cell;
 }

@end
