//
//  SearchResultsTableViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 02/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SearchResultsTableViewController.h"
#import "SavedSearchTableViewCell.h"

@interface SearchResultsTableViewController ()

@end

@implementation SearchResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SavedSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedSearchCellIdentifier" forIndexPath:indexPath];
    NSString *index = [NSString stringWithFormat:@"%li", (long)indexPath.row];
    cell.savedSearchHeader.text = [self createHeaderTitleForSearchItemAtIndexPath:indexPath];
    cell.notificationFrequence.text = [[NSString stringWithFormat:@"%@", [self.searchResults[index] valueForKey:@"price"]] stringByAppendingString:@" €"];
    cell.descriptionLabel.text = [self.searchResults[index] valueForKey:@"description"];
    [cell.editButton setHidden:YES];
    [cell.infoButton setHidden:YES];
    [cell.deleteButton setImage:[UIImage imageNamed:@"add_to_favorites"] forState:UIControlStateNormal];
    [cell.deleteButton setImage:[UIImage imageNamed:@"add_to_favorites"] forState:UIControlStateHighlighted];

    NSArray *photosForSearchItem = [self.searchResults[index] valueForKey:@"photos"];
    if (photosForSearchItem.count > 0) {
        cell.mainImageView.image = [UIImage imageWithData:[[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [photosForSearchItem objectAtIndex:0]]]];
    }
    return cell;
}

- (NSString *)createHeaderTitleForSearchItemAtIndexPath: (NSIndexPath *)indexPath {
    NSString *index = [NSString stringWithFormat:@"%li", (long)indexPath.row];

    NSString *square = [NSString stringWithFormat:@"%@", [self.searchResults[index] valueForKey:@"square"]];
    NSString *city = [self.searchResults[index] valueForKey:@"city"];
    NSString *district = [self.searchResults[index] valueForKey:@"district"];
    NSString *street = [self.searchResults[index] valueForKey:@"street"];
    NSString *houseNumber = [NSString stringWithFormat:@"%@", [self.searchResults[index] valueForKey:@"houseNr"]];

    return [[[[[[[[square stringByAppendingString:@" m2, "] stringByAppendingString:city] stringByAppendingString:@", "] stringByAppendingString:district] stringByAppendingString:@", "] stringByAppendingString:street]stringByAppendingString:@" "]stringByAppendingString:houseNumber];
}
/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
