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
    Catalog          = 2,
    SavedSearches    = 3,
    Favorites        = 4,
    MyAdvertisements = 5,
    AddAdvertisement = 6,
    Feedback         = 7,
    Russian          = 8,
    Latvian          = 9
} Menu;

@interface MenuViewController : AMSlideMenuLeftTableViewController

@end
