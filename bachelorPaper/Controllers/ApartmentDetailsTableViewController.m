//
//  ApartmentDetailsTableViewController.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 07/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "ApartmentDetailsTableViewController.h"
#import "ParameterWithActionTableViewCell.h"
#import "LocalizationSystem.h"

@interface ApartmentDetailsTableViewController ()

@property (strong, nonatomic) NSString *address;

@end

@implementation ApartmentDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.address;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *favoritesButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(manageFavorites:)];
    favoritesButton.image = [UIImage imageNamed:@"add_to_favorites"];
    self.navigationItem.rightBarButtonItem = favoritesButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 7;
        case 2:
            return 3;
        case 3:
            return 4;
        default:
            return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0: {
            if (indexPath.row == 1) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"price", nil);
                return cell;
            } else {
                ParameterWithActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"parameterWithAcionCellIdentifier" forIndexPath:indexPath];
                [cell.actionButton addTarget:self action:@selector(showOnMap) forControlEvents:UIControlEventAllEvents];
                [cell.actionButton setImage:[UIImage imageNamed:@"place_marker"] forState:UIControlStateNormal];
                [cell.actionButton setImage:[UIImage imageNamed:@"place_marker"] forState:UIControlStateHighlighted];
                return cell;
            }
        }
        case 1: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
            cell.textLabel.text = AMLocalizedString(@"price", nil);
            return cell;
        }
        case 2: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
            cell.textLabel.text = AMLocalizedString(@"price", nil);
            return cell;
        }
        case 3: {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"price", nil);
                return cell;
            } else {
                ParameterWithActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"parameterWithAcionCellIdentifier" forIndexPath:indexPath];
                [cell.actionButton setImage:[UIImage imageNamed:@"call"] forState:UIControlStateNormal];
                [cell.actionButton setImage:[UIImage imageNamed:@"call"] forState:UIControlStateHighlighted];
                return cell;
            }
        }
        default:
            break;
    }
    return cell;
}

- (void)manageFavorites: (UIButton *)sender {
    NSLog(@"!!!");
}

- (void)showOnMap {
    [self performSegueWithIdentifier:@"showMapSegueIdentifier" sender:nil];
    
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
