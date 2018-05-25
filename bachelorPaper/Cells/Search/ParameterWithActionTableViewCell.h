//
//  ParameterWithActionTableViewCell.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 11/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParameterWithActionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UILabel *parameterLabel;

@end
