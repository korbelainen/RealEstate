//
//  FeedbackDescriptionTableViewCell.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 04/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "FeedbackDescriptionTableViewCell.h"
#import "LocalizationSystem.h"

@implementation FeedbackDescriptionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.screenshotLabel.text = AMLocalizedString(@"add_screenshot", nil);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
