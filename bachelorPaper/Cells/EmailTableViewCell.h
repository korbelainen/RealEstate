//
//  EmailTableViewCell.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 04/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@end
