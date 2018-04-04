//
//  EmailTableViewCell.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 04/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "EmailTableViewCell.h"
#import "LocalizationSystem.h"

@implementation EmailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.emailTextField setBorderStyle:UITextBorderStyleNone];
    self.sendButton.layer.cornerRadius = 3;
    self.sendButton.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    self.sendButton.tintColor = [UIColor whiteColor];
    self.emailTextField.placeholder = AMLocalizedString(@"email_placeholder", nil);
    self.commentLabel.text = AMLocalizedString(@"email_comment", nil);
    [self.sendButton setTitle:AMLocalizedString(@"send", nil) forState:UIControlStateNormal];
    [self.sendButton setTitle:AMLocalizedString(@"send", nil) forState:UIControlStateHighlighted];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
