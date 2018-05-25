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
#import "ApartmentPhotoTableViewCell.h"

@interface ApartmentDetailsTableViewController ()

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
            return 3;
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return AMLocalizedString(@"apartment_parameters", nil);
    } else if (section == 2) {
        return AMLocalizedString(@"building_parameters", nil);
    } else if (section == 3) {
        return AMLocalizedString(@"description", nil);
    } else {
        return @"";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            if (indexPath.row == 0) {
                NSArray *photos = self.apartmentDetails[@"photos"];
                ApartmentPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"apartmentPhotosCellIdentifier" forIndexPath: indexPath];
                cell.apartmentImageView.image = [UIImage imageWithData:[[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [photos objectAtIndex:0]]]];
                return cell;
            }
           else if (indexPath.row == 1) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                NSString *price = [[NSString stringWithFormat:@"%@", self.apartmentDetails[@"price"]] stringByAppendingString:@" €"];
                cell.textLabel.text = [[AMLocalizedString(@"price", nil) stringByAppendingString: @" "] stringByAppendingString: price];
                return cell;
            } else if (indexPath.row == 2){
                ParameterWithActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"parameterWithAcionCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = self.address;
                [cell.actionButton addTarget:self action:@selector(showOnMap) forControlEvents:UIControlEventAllEvents];
                [cell.actionButton setImage:[UIImage imageNamed:@"place_marker"] forState:UIControlStateNormal];
                [cell.actionButton setImage:[UIImage imageNamed:@"place_marker"] forState:UIControlStateHighlighted];
                return cell;
            }
        }
        case 1: {
            switch (indexPath.row) {
                case 0: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    NSString *square = [NSString stringWithFormat:@"%@", self.apartmentDetails[@"square"]];
                    cell.textLabel.text = [AMLocalizedString(@"square", nil) stringByAppendingString:square];
                    return cell;
                }
                case 1: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    NSString *heatingType = self.apartmentDetails[@"heatingType"];
                    cell.textLabel.text = [AMLocalizedString(@"heating_type", nil) stringByAppendingString: heatingType];
                    return cell;
                }
                case 2: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    BOOL isFurnitureAvailable = self.apartmentDetails[@"furniture"];
                    cell.textLabel.text = AMLocalizedString(@"furniture", nil);
                    cell.accessoryType = (isFurnitureAvailable) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
                    return cell;
                }
                case 3: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    NSString *roomsCount = [NSString stringWithFormat:@"%@", self.apartmentDetails[@"rooms"]];
                    cell.textLabel.text = [AMLocalizedString(@"rooms_count", nil) stringByAppendingString: roomsCount];
                    return cell;
                }
                    
                case 4: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    BOOL isStudio = self.apartmentDetails[@"isStudio"];
                    cell.textLabel.text = AMLocalizedString(@"is_studio", nil);
                    cell.accessoryType = (isStudio) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
                    return cell;
                }
                    
                case 5: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    BOOL isForFent = self.apartmentDetails[@"isForRent"];
                    cell.textLabel.text = AMLocalizedString(@"is_for_rent", nil);
                    cell.accessoryType = (isForFent) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
                    return cell;
                }
                default:
                    break;
            }
        }
        case 2: {
             switch (indexPath.row) {
                case 0: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    NSString *floor = [NSString stringWithFormat:@"%@", self.apartmentDetails[@"floor"]];
                    NSString *floorsCount = [NSString stringWithFormat:@"%@", self.apartmentDetails[@"floors"]];
                    cell.textLabel.text = [[[[AMLocalizedString(@"floor", nil) stringByAppendingString:@" "] stringByAppendingString: floor] stringByAppendingString:AMLocalizedString(@"from", nil)] stringByAppendingString: floorsCount];
                    return cell;
                }
                case 1: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    NSString *buildingMaterial = self.apartmentDetails[@"buildingMaterial"];
                    cell.textLabel.text = [AMLocalizedString(@"building_material", nil) stringByAppendingString:buildingMaterial];
                    return cell;
                }
                case 2: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                    NSString *buildingMaterial = self.apartmentDetails[@"buildingType"];
                    cell.textLabel.text = [AMLocalizedString(@"building_type", nil) stringByAppendingString:buildingMaterial];
                    return cell;
                }
                default:
                    break;
            }
        }
        case 3: {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"", nil);
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
    return [[UITableViewCell alloc] init];
}

- (void)manageFavorites: (UIButton *)sender {
    NSLog(@"!!!");
}

- (void)showOnMap {
    //    [self performSegueWithIdentifier:@"showMapSegueIdentifier" sender:nil];
    
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
