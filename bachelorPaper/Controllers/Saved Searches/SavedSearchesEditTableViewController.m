//
//  SavedSearchesEditTableViewController.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/05/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SavedSearchesEditTableViewController.h"

@interface SavedSearchesEditTableViewController ()

@end

@implementation SavedSearchesEditTableViewController

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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

@end
