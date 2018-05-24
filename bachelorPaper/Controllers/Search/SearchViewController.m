//
//  ViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 22/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SearchViewController.h"
#import "LocalizationSystem.h"
#import "SegmentedControlTableViewCell.h"
#import "SwitchParameterTableViewCell.h"
#import "FromToParameterTableViewCell.h"
#import "RoomCountParameterTableViewCell.h"
#import "SimpleParameterOptionsTableViewController.h"
#import "SearchResultsTableViewController.h"
#import "WebserviceManager.h"

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearBarButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (strong, nonatomic) NSDictionary *searchResults;
@property (strong, nonatomic) NSString *selectedParameter;
@property (assign, nonatomic) BOOL isInRentMode;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = AMLocalizedString(@"search", nil);
    [self.clearBarButton setTitle:AMLocalizedString(@"clear", nil)];
    [self configureSearchButton];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isInRentMode == false) {
        return 3;
    } else {
        return 4;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 4;
        case 1:
            return 3;
        case 2:
            return 4;
        case 3:
            return 4;
        default:
            return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            switch (indexPath.row) {
                case 0: {
                    SegmentedControlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SegementedControlCellIdentifier" forIndexPath:indexPath];
                    [cell.dealTypeSegmentedControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
                    return cell;
                }
                case 1: {
                    RoomCountParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomCountParameterCellIdentifier" forIndexPath:indexPath];
                    return cell;
                }
                case 2: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"studio", nil);
                    return cell;
                }
                case 3: {
                    FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"price", nil);
                    return cell;
                }
                default:
                    break;
            }
        }
        case 1: {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"city", nil);
                return cell;
            } else if (indexPath.row == 1) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"district", nil);
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"street", nil);
                return cell;
            }
        }
        case 2: {
            if (indexPath.row == 0) {
                FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"floor",  nil);
                return cell;
            } else if (indexPath.row == 1) {
                FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"total_area", nil);
                return cell;
            } else if (indexPath.row == 2) {
                SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"balcony", nil);
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"heating_type", nil);
                return cell;
            }
        }
        case 3: {
            switch (indexPath.row) {
                case 0: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"furniture", nil);
                    return cell;
                }
                case 1: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"fridge", nil);
                    return cell;
                }
                case 2: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"communal_payments", nil);
                    return cell;
                }
                case 3: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"internet", nil);
                    return cell;
                }
                    break;

                default:
                    break;
            }
        }
        default: {
            UITableViewCell *cell;
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(void)segmentedControlValueDidChange:(UISegmentedControl *)segment
{
    switch (segment.selectedSegmentIndex) {
        case 0: {
            self.isInRentMode = NO;
            [self.tableView reloadData];
            break;
        }
        case 1: {
            self.isInRentMode = YES;
            [self.tableView reloadData];
            break;
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //    if () {
    //        ((SimpleParameterOptionsTableViewController *)segue.destinationViewController).selectedParameter = self.selectedParameter;
    //    }

    if ([segue.identifier isEqualToString:@"searchResultsTableViewControllerSegue"]) {
         ((SearchResultsTableViewController *)segue.destinationViewController).searchResults = self.searchResults;
    }
}

- (void)configureSearchButton {
    self.searchButton.layer.cornerRadius = 3;
    self.searchButton.tintColor = [UIColor whiteColor];
    self.searchButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    [self.searchButton setTitle:AMLocalizedString(@"search", nil) forState:UIControlStateNormal];
    [self.searchButton setTitle:AMLocalizedString(@"search", nil) forState:UIControlStateHighlighted];
}

- (IBAction)searchButtonPressed:(id)sender {
    [[WebserviceManager sharedInstance] performSearchWithParameters:@{} success:^(NSDictionary *responseObject) {
        self.searchResults = responseObject;
       [self performSegueWithIdentifier:@"searchResultsTableViewControllerSegue" sender:nil];
    }];
}
@end

