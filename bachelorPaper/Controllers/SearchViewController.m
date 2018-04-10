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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 4;
        case 1:
            return 3;
        case 2:
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

        default: {
            UITableViewCell *cell;
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
