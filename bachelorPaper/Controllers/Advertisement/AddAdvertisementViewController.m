//
//  AddAdvertisementViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 11/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "AddAdvertisementViewController.h"
#import "LocalizationSystem.h"
#import "TextFieldParameterTableViewCell.h"
#import "SwitchParameterTableViewCell.h"

@interface AddAdvertisementViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AddAdvertisementViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = AMLocalizedString(@"new_advertisemement", nil);

    UIBarButtonItem *favoritesButton = [[UIBarButtonItem alloc] initWithTitle:AMLocalizedString(@"next", nil) style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed:)];
    self.navigationItem.rightBarButtonItem = favoritesButton;
      [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 3;
    } else if (section == 0) {
        return 5;
    } else {
        return 4;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0: {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"deal_type", nil);
                return cell;
            }
            case 1: {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"city", nil);
                return cell;
            }
            case 2: {
                TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldParameterCellIdentifier" forIndexPath:indexPath];
                cell.parameterTextfield.delegate = self;
                cell.parameterTextfield.placeholder = AMLocalizedString(@"street", nil);
                return cell;
            }
            case 3: {
                TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldParameterCellIdentifier" forIndexPath:indexPath];
                         cell.parameterTextfield.delegate = self;
                cell.parameterTextfield.placeholder = AMLocalizedString(@"house_number", nil);
                return cell;
            }
            case 4: {
                TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldParameterCellIdentifier" forIndexPath:indexPath];
                         cell.parameterTextfield.delegate = self;
                cell.parameterTextfield.placeholder = AMLocalizedString(@"price", nil);
                return cell;
            }
            default: {
                UITableViewCell *cell;
                return cell;
            }
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0: {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"house_type", nil);
                return cell;
            }
            case 1: {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterCellIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"house_material", nil);
                return cell;
            }
            case 2: {
                TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldParameterCellIdentifier" forIndexPath:indexPath];
                         cell.parameterTextfield.delegate = self;
                cell.parameterTextfield.placeholder = AMLocalizedString(@"floors_count", nil);
                return cell;
            }
            default: {
                UITableViewCell *cell;
                return cell;
            }
        }
    } else {
        switch (indexPath.row) {
            case 0: {
                TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldParameterCellIdentifier" forIndexPath:indexPath];
                         cell.parameterTextfield.delegate = self;
                cell.parameterTextfield.placeholder = AMLocalizedString(@"total_area", nil);
                return cell;
            }
            case 1: {
                TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldParameterCellIdentifier" forIndexPath:indexPath];
                         cell.parameterTextfield.delegate = self;
                cell.parameterTextfield.placeholder = AMLocalizedString(@"rooms_count", nil);
                return cell;
            }
            case 2: {
                TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldParameterCellIdentifier" forIndexPath:indexPath];
                         cell.parameterTextfield.delegate = self;
                cell.parameterTextfield.placeholder = AMLocalizedString(@"floor", nil);
                return cell;
            }
            case 3: {
                SwitchParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"switchParameterCellIdentifier" forIndexPath:indexPath];
                cell.parameterLabel.text = AMLocalizedString(@"balcony", nil);
                return cell;
            }
            default: {
                UITableViewCell *cell;
                return cell;
            }
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)nextButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"addPhotosSegueIdentifier" sender:nil];
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
