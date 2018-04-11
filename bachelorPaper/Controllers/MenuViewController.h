//
//  MenuViewController.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 23/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "AMSlideMenuLeftTableViewController.h"

typedef enum {
    Login            = 0,
    Search           = 1,
    SavedSearches    = 2,
    Favorites        = 3,
    MyAdvertisements = 4,
    AddAdvertisement = 5,
    Feedback         = 6,
    Russian          = 7,
    Latvian          = 8
} Menu;

@interface MenuViewController : AMSlideMenuLeftTableViewController

@end
