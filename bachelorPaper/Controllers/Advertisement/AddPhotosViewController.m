//
//  AddPhotosViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 13/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "AddPhotosViewController.h"
#import "LocalizationSystem.h"

@interface AddPhotosViewController ()
@property (weak, nonatomic) IBOutlet UILabel *addPhotosLabel;
@property (weak, nonatomic) IBOutlet UILabel *addPhotosComment;
@property (weak, nonatomic) IBOutlet UIButton *addPhotosButton;

@end

@implementation AddPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    [self configureAddPhotosButton];

    self.addPhotosLabel.text = AMLocalizedString(@"add_photos", nil);
    self.addPhotosComment.text = AMLocalizedString(@"add_photos_comment", nil);

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:AMLocalizedString(@"next", nil) style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed:)];
    doneButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (IBAction)addPhotosButtonPressed:(id)sender {
}

- (void)configureAddPhotosButton {
    self.addPhotosButton.layer.cornerRadius = 3;
    self.addPhotosButton.tintColor = [UIColor whiteColor];
    self.addPhotosButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    [self.addPhotosButton setTitle:AMLocalizedString(@"add_photos_button", nil) forState:UIControlStateNormal];
    [self.addPhotosButton setTitle:AMLocalizedString(@"add_photos_button", nil) forState:UIControlStateHighlighted];
}

- (void)nextButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"descriptionControllerSegue" sender:nil];
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
