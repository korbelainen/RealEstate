//
//  RoomCountParameterTableViewCell.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 23/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomCountParameterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *roomCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *oneRoom;
@property (weak, nonatomic) IBOutlet UIButton *twoRooms;
@property (weak, nonatomic) IBOutlet UIButton *threeRomms;
@property (weak, nonatomic) IBOutlet UIButton *fourRooms;

@property (strong, nonatomic) NSMutableArray *selectedRooms;

@end
