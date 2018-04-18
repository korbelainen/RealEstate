//
//  DescriptionViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 18/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "DescriptionViewController.h"
#import "LocalizationSystem.h"

@interface DescriptionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)configureContinueButton {
    self.continueButton.layer.cornerRadius = 3;
    self.continueButton.tintColor = [UIColor whiteColor];
    self.continueButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    [self.continueButton setTitle:AMLocalizedString(@"next", nil) forState:UIControlStateNormal];
    [self.continueButton setTitle:AMLocalizedString(@"next", nil) forState:UIControlStateHighlighted];
}

- (IBAction)continueButtonPressed:(id)sender {
    [self performSegueWithIdentifier: @"ContactsControllerSegueIdentifier" sender:nil];
}

@end
