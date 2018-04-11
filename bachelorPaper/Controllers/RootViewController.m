//
//  RootViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 02/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "RootViewController.h"

NSInteger kMenuButtonHeight = 35;
NSInteger kMenuButtonWidth = 35;

@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slideMenuDelegate = self;
}

-(BOOL)deepnessForLeftMenu
{
    return YES;
}

-(CGFloat)maxDarknessWhileLeftMenu
{
    return 0.3f;
}

-(CGFloat)panGestureWarkingAreaPercent
{
    return 30;
}

-(NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath
{
    NSString *identifier;
    switch (indexPath.row) {
        case Login: {
            identifier = @"login";
            break;
        }
        case Search: {
            identifier = @"search";
            break;
        }
        case SavedSearches: {
            identifier = @"savedSearches";
            break;
        }
        case Favorites: {
            identifier = @"favorites";
            break;
        }
        case MyAdvertisements: {
            identifier = @"myAdvertisements";
            break;
        }
        case AddAdvertisement: {
            identifier = @"addAdvertisement";
            break;
        }
        case Feedback: {
            identifier = @"feedback";
            break;
        }
        default:
            break;
    }

    return identifier;
}

-(void)configureLeftMenuButton:(UIButton *)button
{
    button.frame = CGRectMake(0, 0, kMenuButtonWidth, kMenuButtonHeight);
    [button setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
}

@end
