//
//  RoomCountParameterTableViewCell.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 23/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "RoomCountParameterTableViewCell.h"
#import "LocalizationSystem.h"

@implementation RoomCountParameterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.roomCountLabel.text = AMLocalizedString(@"rooms_count", nil);

    self.oneRoom.layer.cornerRadius = 3;
    self.oneRoom.layer.borderColor = CFBridgingRetain([UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0]);
    self.oneRoom.layer.borderWidth = 1;

    self.twoRooms.layer.cornerRadius = 3;
    self.twoRooms.layer.borderColor = CFBridgingRetain([UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0]);
    self.twoRooms.layer.borderWidth = 1;

    self.threeRomms.layer.cornerRadius = 3;
    self.threeRomms.layer.borderColor = CFBridgingRetain([UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0]);
    self.threeRomms.layer.borderWidth = 1;

    self.fourRooms.layer.cornerRadius = 3;
    self.fourRooms.layer.borderColor = CFBridgingRetain([UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0]);
    self.fourRooms.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
