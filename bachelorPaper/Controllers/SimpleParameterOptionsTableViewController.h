//
//  SimpleParameterOptionsTableViewController.h
//  bachelorPaper
//
//  Created by Lily Kazutina on 09/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleParameterSelectionDelegate.h"

@interface SimpleParameterOptionsTableViewController : UITableViewController

@property (strong, nonatomic) NSString *selectedParameter;
@property (nonatomic, weak) id <SimpleParameterSelectionDelegate> delegate;

@end
