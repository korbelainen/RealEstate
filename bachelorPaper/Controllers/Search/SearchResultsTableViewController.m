//
//  SearchResultsTableViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 02/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SearchResultsTableViewController.h"
#import "SavedSearchTableViewCell.h"
#import "ApartmentDetailsTableViewController.h"

@interface SearchResultsTableViewController ()

@property (assign, nonatomic) NSInteger selectedApartmentIndex;

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
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SavedSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedSearchCellIdentifier" forIndexPath:indexPath];
    cell.savedSearchHeader.text = [self createHeaderTitleForSearchItemAtIndexPath:indexPath forController:NO];
    cell.notificationFrequence.text = [[NSString stringWithFormat:@"%@", [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"price"]] stringByAppendingString:@" €"];
    cell.descriptionLabel.text = [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"description"];
    [cell.editButton setHidden:YES];
    [cell.infoButton setHidden:YES];
    [cell.deleteButton setImage:[UIImage imageNamed:@"add_to_favorites"] forState:UIControlStateNormal];
    [cell.deleteButton setImage:[UIImage imageNamed:@"add_to_favorites"] forState:UIControlStateHighlighted];

    NSArray *photosForSearchItem = [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"photos"];
    if (photosForSearchItem.count > 0) {
        cell.mainImageView.image = [UIImage imageWithData:[[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [photosForSearchItem objectAtIndex:0]]]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedApartmentIndex = indexPath.row;
    [self performSegueWithIdentifier:@"SearchResultItemSegueIdentifier" sender:nil];
}

- (NSString *)createHeaderTitleForSearchItemAtIndexPath: (NSIndexPath *)indexPath forController:(BOOL) willBeUsedAsControllerTitle {
        NSString *square = [NSString stringWithFormat:@"%@", [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"square"]];
        NSString *city = [NSString stringWithFormat:@"%@", [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"city"]];
        NSString *district = [NSString stringWithFormat:@"%@", [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"district"]];
        NSString *street = [NSString stringWithFormat:@"%@", [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"street"]];
        NSString *houseNumber = [NSString stringWithFormat:@"%@", [[self.searchResults objectAtIndex:indexPath.row] valueForKey:@"houseNr"]];

    if (willBeUsedAsControllerTitle == YES) {
         return [[[[[[city stringByAppendingString:@", "] stringByAppendingString:district] stringByAppendingString:@", "] stringByAppendingString:street]stringByAppendingString:@" "]stringByAppendingString:houseNumber];
    } else {
         return [[[[[[[[square stringByAppendingString:@" m2, "] stringByAppendingString:city] stringByAppendingString:@", "] stringByAppendingString:district] stringByAppendingString:@", "] stringByAppendingString:street]stringByAppendingString:@" "]stringByAppendingString:houseNumber];
    }
}

 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"SearchResultItemSegueIdentifier"]) {
         ((ApartmentDetailsTableViewController *)segue.destinationViewController).apartmentDetails = [self.searchResults objectAtIndex: self.selectedApartmentIndex];
         ((ApartmentDetailsTableViewController *)segue.destinationViewController).address = [self createHeaderTitleForSearchItemAtIndexPath:[NSIndexPath indexPathForRow:self.selectedApartmentIndex inSection:0] forController:YES];
     }
 }

@end
