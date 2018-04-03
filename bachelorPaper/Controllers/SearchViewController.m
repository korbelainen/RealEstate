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

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearBarButton;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = AMLocalizedString(@"search", nil);
    [self.clearBarButton setTitle:AMLocalizedString(@"clear", nil)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 9;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 8;
        case 1:
            return 1;
        case 2:
            return 4;
        case 3:
            return 3;
        case 4:
            return 1;
        case 5:
            return 3;
        case 6:
            return 3;
        case 7:
            return 2;
        case 8:
            return 4;
        case 9:
            return 2;
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
                        return cell;
                    }
                    case 1: {
                        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                        cell.textLabel.text = AMLocalizedString(@"category", nil);
                        return cell;
                    }
                    case 2: {
                        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                        cell.textLabel.text = AMLocalizedString(@"type", nil);
                        return cell;
                    }
                    case 3: {
                        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                        cell.textLabel.text = AMLocalizedString(@"location", nil);
                        return cell;
                    }
                    case 4: {
                        RoomCountParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomCountParameterCellIdentifier" forIndexPath:indexPath];
                        return cell;
                    }
                    case 5: {
                        SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                        cell.parameterLabel.text = AMLocalizedString(@"studio", nil);
                        return cell;
                    }
                    case 6: {
                        FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
                        return cell;
                    }
                    case 7: {
                        SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                        cell.parameterLabel.text = AMLocalizedString(@"with_photos", nil);
                        return cell;
                    }
                    default:
                        break;
                }
        }
        case 1: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
             cell.textLabel.text = @"test 1";
            return cell;
        }
        case 2: {
            if (indexPath.row == 1 || indexPath.row == 2) {
                SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                return cell;
            } else {
                FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
                return cell;
            }
        }
        case 3: {
            FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
            return cell;

        }
        case 4: {
            FromToParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FromToParameterTableViewCellIdentifier" forIndexPath:indexPath];
            return cell;
        }

        case 5: {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"building_material", nil);
                return cell;
            } else if (indexPath.row == 1) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"building_type", nil);
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"building_class", nil);
                return cell;
            }
        }
        case 6: {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"layout", nil);
                return cell;
            } else if (indexPath.row == 1) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"bathroom", nil);
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"apartment_type", nil);
                return cell;
            }
        }
        case 7: {
            if (indexPath.row == 0) {
                SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"balcony", nil);
                return cell;
            } else {
                SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"loggia", nil);
                return cell;
            }
        }
        case 8: {
            switch (indexPath.row) {
                case 0: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"bargain_possible", nil);
                    return cell;
                }
                case 1: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"mortgage_possible", nil);
                    return cell;
                }
                case 2: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"change", nil);
                    return cell;
                }
                case 3: {
                    SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
                    cell.parameterLabel.text = AMLocalizedString(@"clean_sale", nil);
                    return cell;
                }
                default:
                    break;
            }
            SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchParameterTableViewCellIdentifier" forIndexPath:indexPath];
            return cell;
        }
        case 9: {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"author", nil);
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"date", nil);
                return cell;
            }
        }
        default: {
            UITableViewCell *cell;
            return cell;
        }
    }
}

@end
