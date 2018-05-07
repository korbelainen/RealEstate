//
//  SavedSearchesViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 22/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SavedSearchesViewController.h"
#import "SavedSearchTableViewCell.h"
#import "LocalizationSystem.h"
#import "SavedSearchesInfoTableViewController.h"

@interface SavedSearchesViewController () <UITableViewDelegate>

@property (strong, nonatomic) NSArray *savedSearches;
@property (assign, nonatomic) BOOL isEditMode;

@end

@implementation SavedSearchesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.savedSearches = @[@""];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.savedSearches.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SavedSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedSearchCellIdentifier" forIndexPath:indexPath];
    [cell.editButton setTitle:AMLocalizedString(@"edit", nil) forState:UIControlStateNormal];
    [cell.editButton setTitle:AMLocalizedString(@"edit", nil) forState:UIControlStateHighlighted];
    return cell;
}

- (IBAction)deleteButtonPressed:(id)sender {
}

- (IBAction)infoButtonPressed:(id)sender {
    self.isEditMode = NO;
    [self performSegueWithIdentifier:@"savedSearchDetailsSegueIdentifier" sender:nil];
}

- (IBAction)editButtonPressed:(id)sender {
    self.isEditMode = YES;
    [self performSegueWithIdentifier:@"savedSearchDetailsSegueIdentifier" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"savedSearchDetailsSegueIdentifier"]) {
        ((SavedSearchesInfoTableViewController *)segue.destinationViewController).isEditMode = self.isEditMode;
    }
}
@end
