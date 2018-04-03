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

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.tintColor = [UIColor whiteColor];
    [self.loginButton setTitle:AMLocalizedString(@"login", nil)];
    self.title = AMLocalizedString(@"login", nil);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row > 1) {
        ForgetPasswordTableViewCell *forgetPasswordCell = [tableView dequeueReusableCellWithIdentifier:@"ForgetPasswodCellIdentifier" forIndexPath:indexPath];
        return forgetPasswordCell;
    } else {
        LoginInputTableViewCell *inputCell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputCellIdentifier" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            inputCell.textField.placeholder = AMLocalizedString(@"email_or_phone", nil);
        } else {
            inputCell.textField.placeholder = AMLocalizedString(@"password", nil);
        }
        return inputCell;
    }
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)login:(id)sender {
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
