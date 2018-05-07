//
//  ForgetPasswordTableViewCell.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 26/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "ForgetPasswordTableViewCell.h"
#import "LocalizationSystem.h"

@implementation ForgetPasswordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.forgetPasswordButton setTitle:AMLocalizedString(@"forget_password", nil) forState:UIControlStateNormal];
    [self.forgetPasswordButton setTitle:AMLocalizedString(@"forget_password", nil)  forState:UIControlStateHighlighted];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
