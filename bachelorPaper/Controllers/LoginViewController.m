//
//  LoginViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 22/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "LoginViewController.h"
#import "LocalizationSystem.h"
#import "LoginInputTableViewCell.h"
#import "ForgetPasswordTableViewCell.h"
#import "WebserviceManager.h"


typedef enum {
    LoginViewMode        = 1,
    RegistrationViewMode = 2
    
} ControllerViewMode;

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginButton;
@property (assign, nonatomic) NSInteger currentViewMode;

@property (strong, nonatomic) NSMutableDictionary *credentials;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.tintColor = [UIColor whiteColor];
    self.currentViewMode = LoginViewMode;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.loginButton setTitle:AMLocalizedString(@"login", nil)];
    self.title = AMLocalizedString(@"login", nil);
    self.credentials = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"", @"username", @"", @"email", @"", @"password", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.currentViewMode == LoginViewMode) {
        return 4;
    } else {
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentViewMode == LoginViewMode) {
        switch (indexPath.row) {
            case 0: {
                LoginInputTableViewCell *inputCell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputCellIdentifier" forIndexPath:indexPath];
                inputCell.textField.placeholder = AMLocalizedString(@"email_or_phone", nil);
                inputCell.textField.delegate = self;
                [inputCell.textField addTarget:self action:@selector(textfieldChanged:) forControlEvents:UIControlEventAllEvents];
                return inputCell;
            }
            case 1: {
                LoginInputTableViewCell *inputCell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputCellIdentifier" forIndexPath:indexPath];
                inputCell.textField.placeholder = AMLocalizedString(@"password", nil);
//                inputCell.textField.secureTextEntry = YES;
                inputCell.textField.delegate = self;
                [inputCell.textField addTarget:self action:@selector(textfieldChanged:) forControlEvents:UIControlEventAllEvents];
                return inputCell;
            }
            case 2: {
                ForgetPasswordTableViewCell *forgetPasswordCell = [tableView dequeueReusableCellWithIdentifier:@"ForgetPasswodCellIdentifier" forIndexPath:indexPath];
                return forgetPasswordCell;
            }
            case 3: {
                ForgetPasswordTableViewCell *forgetPasswordCell = [tableView dequeueReusableCellWithIdentifier:@"ForgetPasswodCellIdentifier" forIndexPath:indexPath];
                [forgetPasswordCell.forgetPasswordButton setTitle:AMLocalizedString(@"registration", nil) forState:UIControlStateNormal];
                [forgetPasswordCell.forgetPasswordButton addTarget:self action:@selector(changeToRegistrationMode) forControlEvents:UIControlEventAllEvents];
                return forgetPasswordCell;
            }
            default: {
                UITableViewCell *cell = [[UITableViewCell alloc]init];
                return cell;
            }
        }
    } else {
        switch (indexPath.row) {
            case 0: {
                LoginInputTableViewCell *inputCell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputCellIdentifier" forIndexPath:indexPath];
                inputCell.textField.placeholder = AMLocalizedString(@"username", nil);
                [inputCell.textField addTarget:self action:@selector(textfieldChanged:) forControlEvents:UIControlEventAllEvents];
                inputCell.textField.delegate = self;
                return inputCell;
            }
            case 1: {
                LoginInputTableViewCell *inputCell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputCellIdentifier" forIndexPath:indexPath];
                inputCell.textField.placeholder = AMLocalizedString(@"email", nil);
                inputCell.textField.delegate = self;
                [inputCell.textField addTarget:self action:@selector(textfieldChanged:) forControlEvents:UIControlEventAllEvents];
                return inputCell;
            }
            case 2: {
                LoginInputTableViewCell *inputCell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputCellIdentifier" forIndexPath:indexPath];
                inputCell.textField.placeholder = AMLocalizedString(@"password", nil);
//                inputCell.textField.secureTextEntry = YES;
                inputCell.textField.delegate = self;
                [inputCell.textField addTarget:self action:@selector(textfieldChanged:) forControlEvents:UIControlEventAllEvents];
                return inputCell;
            }
            case 3: {
                ForgetPasswordTableViewCell *forgetPasswordCell = [tableView dequeueReusableCellWithIdentifier:@"ForgetPasswodCellIdentifier" forIndexPath:indexPath];
                return forgetPasswordCell;
            }
            case 4: {
                ForgetPasswordTableViewCell *forgetPasswordCell = [tableView dequeueReusableCellWithIdentifier:@"ForgetPasswodCellIdentifier" forIndexPath:indexPath];
                [forgetPasswordCell.forgetPasswordButton setTitle:AMLocalizedString(@"registration", nil) forState:UIControlStateNormal];
                [forgetPasswordCell.forgetPasswordButton addTarget:self action:@selector(changeToRegistrationMode) forControlEvents:UIControlEventAllEvents];
                return forgetPasswordCell;
            }
                break;
                
            default: {
                UITableViewCell *cell = [[UITableViewCell alloc]init];
                return cell;
            }
        }
    }
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)login:(id)sender {
    if (self.currentViewMode == LoginViewMode) {
        [self login];
    } else {
        [self registration];
    }
}

- (void)textfieldChanged:(UITextField *)textField {
    if ([textField.placeholder isEqualToString:AMLocalizedString(@"password", nil)]) {
        [self.credentials setValue:textField.text forKey:@"password"];
    } else if ([textField.placeholder isEqualToString:AMLocalizedString(@"username", nil)]) {
        [self.credentials setValue:textField.text forKey:@"username"];
    } else {
        [self.credentials setValue:textField.text forKey:@"email"];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)changeToRegistrationMode {
    self.currentViewMode = RegistrationViewMode;
    [self.loginButton setTitle:AMLocalizedString(@"done", nil)];
    self.title = AMLocalizedString(@"registration", nil);
    [self.tableView reloadData];
}

- (void)changeToLoginMode {
    self.currentViewMode = LoginViewMode;
    [self.loginButton setTitle:AMLocalizedString(@"login", nil)];
    self.title = AMLocalizedString(@"login", nil);
    [self.credentials removeAllObjects];
    [self.tableView reloadData];
}

- (void)login {
    [[WebserviceManager sharedInstance] loginWithEmail:self.credentials[@"email"] andPassword:self.credentials[@"password"] success:^(NSDictionary *responseObject) {
        if ([[responseObject[@"error"] stringValue] isEqualToString:@"0"]) {
            
            [[NSUserDefaults standardUserDefaults] setValue:@"yes" forKey:@"isLogedIn"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            [self performSegueWithIdentifier:@"userProfileSegue" sender:nil];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:
                                        AMLocalizedString(@"login_failed", nil) message:AMLocalizedString(@"check_credentials", nil) preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* Cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel
                                                           handler:nil];
            [alert addAction:Cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

- (void)registration {
    [[WebserviceManager sharedInstance] performRegistrationWithUsername:self.credentials[@"username"] email:self.credentials[@"email"] andPassword:self.credentials[@"password"] success:^(NSDictionary *responseObject) {
        if ([[responseObject[@"error"] stringValue] isEqualToString:@"0"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:
                                        AMLocalizedString(@"Registration is successful", nil) message:AMLocalizedString(@"", nil) preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* Cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel
                                                           handler:^(UIAlertAction * action) {
                                                               [self changeToLoginMode];
                                                           }];
            [alert addAction:Cancel];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            if ([[responseObject[@"errCode"] stringValue] isEqualToString:@"400"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:
                                            AMLocalizedString(@"Invalid input data!", nil) message:AMLocalizedString(@"Check input values and try again.", nil) preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* Cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel
                                                               handler:^(UIAlertAction * action) {
                                                               }];
                [alert addAction:Cancel];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }
    }];
}
@end
