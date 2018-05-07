//
//  SwitchParameterTableViewCell.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 23/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchParameterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *parameterLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchControl;

@end
