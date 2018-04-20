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
    
    self.currentViewMode = 1;
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.currentViewMode == LoginViewMode) {
        [self.loginButton setTitle:AMLocalizedString(@"login", nil)];
        self.title = AMLocalizedString(@"login", nil);
        self.credentials = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"", @"username", @"", @"password", nil];
    } else {
        [self.loginButton setTitle:AMLocalizedString(@"done", nil)];
        self.title = AMLocalizedString(@"registration", nil);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row > 1) {
        if (self.currentViewMode == 1) {
            ForgetPasswordTableViewCell *forgetPasswordCell = [tableView dequeueReusableCellWithIdentifier:@"ForgetPasswodCellIdentifier" forIndexPath:indexPath];
            return forgetPasswordCell;
        } else {
            UITableViewCell *cell = [[UITableViewCell alloc]init];
            return cell;
        }

    } else {
        LoginInputTableViewCell *inputCell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputCellIdentifier" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            inputCell.textField.placeholder = AMLocalizedString(@"email_or_phone", nil);
            inputCell.textField.delegate = self;
        } else {
            inputCell.textField.placeholder = AMLocalizedString(@"password", nil);
            inputCell.textField.delegate = self;
        }
        return inputCell;
    }
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)login:(id)sender {
    [[WebserviceManager sharedInstance] loginWithEmail:self.credentials[@"username"] andPassword:self.credentials[@"password"] success:^(NSDictionary *responseObject) {
        if ([[responseObject[@"error"] stringValue] isEqualToString:@"0"]) {
            
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogedIn"];
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

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.placeholder isEqualToString:AMLocalizedString(@"password", nil)]) {
        [self.credentials setValue:textField.text forKey:@"password"];
    } else {
        [self.credentials setValue:textField.text forKey:@"username"];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
