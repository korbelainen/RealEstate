//
//  UserProfileTableViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 26/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "UserProfileTableViewController.h"
#import "LocalizationSystem.h"
#import "TextFieldParameterTableViewCell.h"
#import "WebserviceManager.h"

@interface UserProfileTableViewController ()

@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@end

@implementation UserProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:AMLocalizedString(@"done", nil) style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonPressed:)];
    doneButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self configureLogoutButton];
    
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 4;
        case 1:
            return 2;
        case 2:
            return 3;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            switch (indexPath.row) {
                case 0: {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterIdentifier" forIndexPath:indexPath];
                    cell.textLabel.text = @"username";
                    cell.accessoryType = UITableViewCellAccessoryNone;
                    return cell;
                }
                case 1: {
                    TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellIdentifier" forIndexPath:indexPath];
                    cell.parameterTextfield.placeholder = AMLocalizedString(@"name", nil);
                    return cell;
                }
                case 2: {
                    TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellIdentifier" forIndexPath:indexPath];
                    cell.parameterTextfield.placeholder = AMLocalizedString(@"email", nil);
                    return cell;
                }
                case 3: {
                    TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellIdentifier" forIndexPath:indexPath];
                    cell.parameterTextfield.placeholder = AMLocalizedString(@"phone", nil);
                    return cell;
                }
                default:
                    break;
            }
        }
        case 1: {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"user_type", nil);
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpleParameterIdentifier" forIndexPath:indexPath];
                cell.textLabel.text = AMLocalizedString(@"region", nil);
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            }
        }
        case 2: {
            switch (indexPath.row) {
                case 0: {
                    TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellIdentifier" forIndexPath:indexPath];
                    cell.parameterTextfield.placeholder = AMLocalizedString(@"company", nil);
                    return cell;
                }
                case 1: {
                    TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellIdentifier" forIndexPath:indexPath];
                    cell.parameterTextfield.placeholder = AMLocalizedString(@"address", nil);
                    return cell;
                }
                case 2: {
                    TextFieldParameterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCellIdentifier" forIndexPath:indexPath];
                    cell.parameterTextfield.placeholder = AMLocalizedString(@"web_site", nil);
                    return cell;
                }
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

- (void)fieldsValidation {
    
}

- (void)doneButtonPressed:(UIButton *)sender {
    // probably data should be saved on backend
 
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)configureLogoutButton {
    self.logoutButton.layer.cornerRadius = 3;
    self.logoutButton.tintColor = [UIColor whiteColor];
    self.logoutButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    [self.logoutButton setTitle:AMLocalizedString(@"logout", nil) forState:UIControlStateNormal];
    [self.logoutButton setTitle:AMLocalizedString(@"logout", nil) forState:UIControlStateHighlighted];
}

- (IBAction)logoutButtonPressed:(id)sender {
    [self logout];
}

-(void)logout {
    [[WebserviceManager sharedInstance]performLogoutWithSuccess:^(NSDictionary *responseObject) {
        // should be added check for success
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:AMLocalizedString(@"logout_success", nil)
                                     message:@" "
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogedIn"];
                                       [[NSUserDefaults standardUserDefaults]synchronize];
                                       [self.navigationController popToRootViewControllerAnimated:YES];
                                   }];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

@end
