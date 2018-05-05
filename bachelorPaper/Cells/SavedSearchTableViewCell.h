//
//  SavedSearchTableViewCell.h
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/05/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedSearchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *savedSearchHeader;
@property (weak, nonatomic) IBOutlet UILabel *notificationFrequence;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@property (weak, nonatomic) IBOutlet UIImageView *thirdImageView;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end
