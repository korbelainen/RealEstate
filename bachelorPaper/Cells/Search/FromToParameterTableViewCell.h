//
//  FromToParameterTableViewCell.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 02/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FromToParameterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *parameterLabel;
@property (weak, nonatomic) IBOutlet UITextField *fromTextField;
@property (weak, nonatomic) IBOutlet UITextField *toTextField;

@end
