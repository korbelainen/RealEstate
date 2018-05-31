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

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, SimpleParameterSelectionDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearBarButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (strong, nonatomic) NSMutableDictionary *inputParameters;
@property (strong, nonatomic) NSMutableArray *selectedRooms;
@property (strong, nonatomic) NSString *selectedCity;
@property (strong, nonatomic) NSString *selectedStreet;
@property (strong, nonatomic) NSString *selectedDistrict;
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

    self.selectedRooms = [[NSMutableArray alloc] init];
    self.inputParameters = [[NSMutableDictionary alloc] init];
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
                    cell.oneRoom.tag = 1;
                    [cell.oneRoom addTarget:self action:@selector(roomCountSelected:) forControlEvents:UIControlEventTouchUpInside];
                    cell.twoRooms.tag = 2;
                    [cell.twoRooms addTarget:self action:@selector(roomCountSelected:) forControlEvents:UIControlEventTouchUpInside];
                    cell.threeRomms.tag = 3;
                    [cell.threeRomms addTarget:self action:@selector(roomCountSelected:) forControlEvents:UIControlEventTouchUpInside];
                    cell.fourRooms.tag = 4;
                    [cell.fourRooms addTarget:self action:@selector(roomCountSelected:) forControlEvents:UIControlEventTouchUpInside];
                    return cell;
                }
                case 2: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"studio", nil);
                    [cell.switchControl setOn:NO];
                    cell.switchControl.tag = 0;
                    [cell.switchControl addTarget:self action:@selector(switchControlStateChanged:) forControlEvents:UIControlEventAllEvents];
                    return cell;
                }
                case 3: {
                    FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"price", nil);
                    cell.fromTextField.tag = 0;
                    cell.fromTextField.delegate = self;
                    [cell.fromTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                    cell.toTextField.tag = 1;
                    cell.toTextField.delegate = self;
                    [cell.toTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
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
                cell.detailTextLabel.text = self.selectedCity;
                return cell;
            } else if (indexPath.row == 1) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"district", nil);
                cell.detailTextLabel.text = self.selectedDistrict;
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"street", nil);
                cell.detailTextLabel.text = self.selectedStreet;
                return cell;
            }
        }
        case 2: {
            if (indexPath.row == 0) {
                FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"floor",  nil);
                cell.fromTextField.tag = 2;
                cell.fromTextField.delegate = self;
                [cell.fromTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                cell.toTextField.tag = 3;
                cell.toTextField.delegate = self;
                [cell.toTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                return cell;
            } else if (indexPath.row == 1) {
                FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"total_area", nil);
                cell.fromTextField.tag = 4;
                cell.fromTextField.delegate = self;
                [cell.fromTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                cell.toTextField.tag = 5;
                cell.toTextField.delegate = self;
                [cell.toTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                return cell;
            } else if (indexPath.row == 2) {
                SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"balcony", nil);
                [cell.switchControl setOn:NO];
                cell.switchControl.tag = 1;
                [cell.switchControl addTarget:self action:@selector(switchControlStateChanged:) forControlEvents:UIControlEventAllEvents];
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
                    [cell.switchControl setOn:NO];
                    cell.switchControl.tag = 2;
                    [cell.switchControl addTarget:self action:@selector(switchControlStateChanged:) forControlEvents:UIControlEventAllEvents];
                    return cell;
                }
                case 1: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"fridge", nil);
                    [cell.switchControl setOn:NO];
                    cell.switchControl.tag = 3;
                    [cell.switchControl addTarget:self action:@selector(switchControlStateChanged:) forControlEvents:UIControlEventAllEvents];
                    return cell;
                }
                case 2: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"communal_payments", nil);
                    [cell.switchControl setOn:NO];
                    cell.switchControl.tag = 4;
                    [cell.switchControl addTarget:self action:@selector(switchControlStateChanged:) forControlEvents:UIControlEventAllEvents];
                    return cell;
                }
                case 3: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"internet", nil);
                    [cell.switchControl setOn:NO];
                    cell.switchControl.tag = 5;
                    [cell.switchControl addTarget:self action:@selector(switchControlStateChanged:) forControlEvents:UIControlEventAllEvents];
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

    if (indexPath.row == 0) {
        self.selectedParameter = @"city";
    } else if (indexPath.row == 2) {
        self.selectedParameter = @"street";
    } else if (indexPath.row == 3) {
        self.selectedParameter = @"heatingType";
    }
}

-(void)segmentedControlValueDidChange:(UISegmentedControl *)segment
{
    switch (segment.selectedSegmentIndex) {
        case 0: {
            [self.inputParameters removeObjectForKey:@"for_rent"];
            self.isInRentMode = NO;
            [self.tableView reloadData];
            break;
        }
        case 1: {
            [self.inputParameters setValue:@1 forKey:@"for_rent"];
            self.isInRentMode = YES;
            [self.tableView reloadData];
            break;
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"searchResultsTableViewControllerSegue"]) {
        ((SearchResultsTableViewController *)segue.destinationViewController).searchResults = self.searchResults;
    } else {
        if (([self.selectedParameter isEqualToString:@"city"]) || ([self.selectedParameter isEqualToString:@"street"]) || ([self.selectedParameter isEqualToString:@"heatingType"])){
            ((SimpleParameterOptionsTableViewController *)segue.destinationViewController).selectedParameter = self.selectedParameter;
        }
        ((SimpleParameterOptionsTableViewController *)segue.destinationViewController).delegate = self;
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
    NSLog(@"%@",self.inputParameters);
        [[WebserviceManager sharedInstance] performSearchWithParameters:self.inputParameters success:^(NSDictionary *responseObject) {
            self.searchResults = responseObject;
            [self performSegueWithIdentifier:@"searchResultsTableViewControllerSegue" sender:nil];
        }];
}

- (void)roomCountSelected:(UIButton *) sender {
    switch (sender.tag) {
        case 1:
            if (![self.selectedRooms containsObject:@1]) {
                [self.selectedRooms addObject:@1];
            } else {
                [self.selectedRooms removeObject:@1];
            }
            break;
        case 2:
            if (![self.selectedRooms containsObject:@2]) {
                [self.selectedRooms addObject:@2];
            } else {
                [self.selectedRooms removeObject:@2];
            }
            break;
        case 3:
            if (![self.selectedRooms containsObject:@3]) {
                [self.selectedRooms addObject:@3];
            } else {
                [self.selectedRooms removeObject:@3];
            }
            break;
        case 4:
            if (![self.selectedRooms containsObject:@4]) {
                [self.selectedRooms addObject:@4];
            } else {
                [self.selectedRooms removeObject:@4];
            }
            break;
        default:
            break;
    }

    if (self.selectedRooms.count > 1) {
        self.selectedRooms = [[self.selectedRooms sortedArrayUsingSelector:@selector(compare:)] mutableCopy];

        NSNumber *min = self.selectedRooms.firstObject;
        NSNumber *max = self.selectedRooms.lastObject;

        [self.inputParameters setValue:min forKey:@"room_min"];
        [self.inputParameters setValue:max forKey:@"room_max"];
    } else {
        [self.inputParameters setValue:self.selectedRooms.firstObject forKey:@"room_min"];
        [self.inputParameters setValue:self.selectedRooms.firstObject forKey:@"room_max"];
    }
}

- (void)switchControlStateChanged:(UISwitch *)sender {

    switch (sender.tag) {
        case 0: {
            if (sender.isOn == YES) {
                [self.inputParameters setValue:@1 forKey:@"studio"];
            } else {
                [self.inputParameters removeObjectForKey:@"studio"];
            }
        }
            break;
        case 1:
        {
            if (sender.isOn == YES) {
                [self.inputParameters setValue:@1 forKey:@"balcony"];
            } else {
                [self.inputParameters removeObjectForKey:@"balcony"];
            }
        }
            break;
        case 2:
        {
            if (sender.isOn == YES) {
                [self.inputParameters setValue:@1 forKey:@"furniture"];
            } else {
                [self.inputParameters removeObjectForKey:@"furniture"];
            }
        }
            break;
        case 3:
        {
            if (sender.isOn == YES) {
                [self.inputParameters setValue:@1 forKey:@"fridge"];
            } else {
                [self.inputParameters removeObjectForKey:@"fridge"];
            }
        }
            break;
        case 4:
        {
            if (sender.isOn == YES) {
                [self.inputParameters setValue:@1 forKey:@"communalPayments"];
            } else {
                [self.inputParameters removeObjectForKey:@"communalPayments"];
            }
        }
            break;
        case 5:
        {
            if (sender.isOn == YES) {
                [self.inputParameters setValue:@1 forKey:@"internet"];
            } else {
                [self.inputParameters removeObjectForKey:@"internet"];
            }
        }
            break;
        default:
            break;
    }
}

- (void)simpleParameterSelectedWithValue:(NSString *)value andTitle:(NSString *)title forParameterType:(NSUInteger)type {
    [self.navigationController popViewControllerAnimated:true];
    
    switch (type) {
        case 0:
            [self.inputParameters setValue:value forKey:@"street_id"];
            self.selectedStreet = title;
            [self.tableView reloadData];
            break;
        case 1:
            [self.inputParameters setValue:value forKey:@"district_id"];
            self.selectedDistrict = title;
            [self.tableView reloadData];
            break;
        case 2:
            [self.inputParameters setValue:value forKey:@"city_id"];
            self.selectedCity = title;
            [self.tableView reloadData];
            break;
        default:
            break;
    }
}

#pragma mark - UITextField delegate methods

- (void)textFieldDidChange: (UITextField *)sender {
    switch (sender.tag) {
        case 0:
            if (![sender.text isEqualToString: @""]) {
                [self.inputParameters setValue:sender.text forKey:@"price_min"];
            } else {
                [self.inputParameters removeObjectForKey:@"price_min"];
            }
            break;
        case 1:
            if (![sender.text isEqualToString: @""]) {
                [self.inputParameters setValue:sender.text forKey:@"price_max"];
            } else {
                [self.inputParameters removeObjectForKey:@"price_max"];
            }
            break;
        case 2:
            if (![sender.text isEqualToString: @""]) {
                [self.inputParameters setValue:sender.text forKey:@"floor_min"];
            } else {
                [self.inputParameters removeObjectForKey:@"floor_min"];
            }
            break;
        case 3:
            if (![sender.text isEqualToString: @""]) {
                [self.inputParameters setValue:sender.text forKey:@"floor_max"];
            } else {
                [self.inputParameters removeObjectForKey:@"floor_max"];
            }
            break;
        case 4:
            if (![sender.text isEqualToString: @""]) {
                [self.inputParameters setValue:sender.text forKey:@"square_min"];
            } else {
                [self.inputParameters removeObjectForKey:@"square_min"];
            }
            break;
        case 5:
            if (![sender.text isEqualToString: @""]) {
                [self.inputParameters setValue:sender.text forKey:@"square_max"];
            } else {
                [self.inputParameters removeObjectForKey:@"square_max"];
            }
            break;
        default:
            break;
    }
}
@end
