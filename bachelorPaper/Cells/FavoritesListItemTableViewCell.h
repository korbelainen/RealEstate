//
//  FavoritesListItemTableViewCell.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 04/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesListItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *appartmentPhotosImaveView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@end
