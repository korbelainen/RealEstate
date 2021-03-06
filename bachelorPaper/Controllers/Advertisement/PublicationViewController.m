//
//  PublicationViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 19/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "PublicationViewController.h"
#import "LocalizationSystem.h"

@interface PublicationViewController ()

@property (weak, nonatomic) IBOutlet UIButton *publicationButton;

@end

@implementation PublicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = AMLocalizedString(@"publication", nil);
    [self configurePublicationButton];
}

- (IBAction)publicationButtonPressed:(id)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:AMLocalizedString(@"publication_success", nil)
                                 message:@" "
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                     [self.navigationController popToRootViewControllerAnimated:YES];
                                }];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)configurePublicationButton {
    self.publicationButton.layer.cornerRadius = 3;
    self.publicationButton.tintColor = [UIColor whiteColor];
    self.publicationButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    [self.publicationButton setTitle:AMLocalizedString(@"publish_advertisement", nil) forState:UIControlStateNormal];
    [self.publicationButton setTitle:AMLocalizedString(@"publish_advertisement", nil) forState:UIControlStateHighlighted];
}

@end
