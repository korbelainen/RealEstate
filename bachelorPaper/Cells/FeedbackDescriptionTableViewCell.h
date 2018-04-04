//
//  FeedbackDescriptionTableViewCell.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 04/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackDescriptionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *feedbackDescriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *screenshotLabel;

@end
