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

    self.selectedRooms = [[NSMutableArray alloc] init];

    self.roomCountLabel.text = AMLocalizedString(@"rooms_count", nil);

    self.oneRoom.layer.cornerRadius = 3;
    self.oneRoom.layer.borderColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0].CGColor;
    self.oneRoom.layer.borderWidth = 1.0;
    self.oneRoom.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    self.oneRoom.tintColor = [UIColor whiteColor];

    self.twoRooms.layer.cornerRadius = 3;
    self.twoRooms.layer.borderColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0].CGColor;
    self.twoRooms.layer.borderWidth = 1.0;
    self.twoRooms.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    self.twoRooms.tintColor = [UIColor whiteColor];

    self.threeRomms.layer.cornerRadius = 3;
    self.threeRomms.layer.borderColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0].CGColor;
    self.threeRomms.layer.borderWidth = 1.0;
    self.threeRomms.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    self.threeRomms.tintColor = [UIColor whiteColor];

    self.fourRooms.layer.cornerRadius = 3;
    self.fourRooms.layer.borderColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0].CGColor;
    self.fourRooms.layer.borderWidth = 1.0;
    self.fourRooms.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    self.fourRooms.tintColor = [UIColor whiteColor];

}

- (IBAction)oneRoomButtonPressed:(UIButton *)sender {
    if (![sender.backgroundColor isEqual:[UIColor whiteColor]]) {
        sender.backgroundColor = [UIColor whiteColor];
        sender.tintColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    } else {
        sender.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
        sender.tintColor = [UIColor whiteColor];
    }
}

- (IBAction)twoRoomsButtonPressed:(UIButton *)sender {
    if (![sender.backgroundColor isEqual:[UIColor whiteColor]]) {
        sender.backgroundColor = [UIColor whiteColor];
        sender.tintColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    } else {
        sender.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
        sender.tintColor = [UIColor whiteColor];
    }
}

- (IBAction)threeRoomsButtonPressed:(UIButton *)sender {
    if (![sender.backgroundColor isEqual:[UIColor whiteColor]]) {
        sender.backgroundColor = [UIColor whiteColor];
        sender.tintColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    } else {
        sender.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
        sender.tintColor = [UIColor whiteColor];
    }
}

- (IBAction)fourRoomsButtonPressed:(UIButton *)sender {
    if (![sender.backgroundColor isEqual:[UIColor whiteColor]]) {
        sender.backgroundColor = [UIColor whiteColor];
        sender.tintColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
    } else {
        sender.backgroundColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
        sender.tintColor = [UIColor whiteColor];
    }
}
@end
