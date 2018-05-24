//
//  SegmentedControlTableViewCell.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 23/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SegmentedControlTableViewCell.h"
#import "LocalizationSystem.h"

@implementation SegmentedControlTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.dealTypeSegmentedControl setTitle:AMLocalizedString(@"sale", nil) forSegmentAtIndex:0];
    [self.dealTypeSegmentedControl setTitle:AMLocalizedString(@"rent", nil) forSegmentAtIndex:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
