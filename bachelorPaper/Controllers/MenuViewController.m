//
//  MenuViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 23/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuItemTableViewCell.h"
#import "LocalizationSystem.h"

static NSArray *menuIcons;
static NSArray *activeMenuIcons;
static NSArray *menuTitles;

@interface MenuViewController ()

@property (assign, nonatomic) NSInteger activeMenuItem;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.activeMenuItem = 0;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.0];
}

+ (void)initialize
{
    menuIcons = @[@"white-user_male_circle",
                  @"white-skyscrapers",
                  @"white-bookmark",
                  @"white-star",
                  @"white-documents",
                  @"white-plus",
                  @"white-message",
                  @"russian",
                  @"latvian"];

    activeMenuIcons = @[@"red-user_male_circle",
                        @"red-skyscrapers",
                        @"red-bookmark",
                        @"red-star",
                        @"red-documents",
                        @"red-plus",
                        @"red-message",
                        @"russian",
                        @"latvian"];

    menuTitles = @[AMLocalizedString(@"login", nil),
                  AMLocalizedString(@"advertisement_search", nil),
                   AMLocalizedString(@"new_buildings_catalog", nil),
                   AMLocalizedString(@"saved_searches", nil),
                   AMLocalizedString(@"favorites", nil),
                   AMLocalizedString(@"my_advertisements", nil),
                   AMLocalizedString(@"add_advertisement", nil),
                   AMLocalizedString(@"feedack", nil)
                   ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 4;
        case 3:
            return 3;
            break;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCellIdentifier" forIndexPath:indexPath];

    if (self.activeMenuItem == indexPath.row) {
        cell.menuItemLabel.text = [menuTitles objectAtIndex:indexPath.row];
        cell.menuItemLabel.textColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
        cell.menuItemIcon.image = [UIImage imageNamed:[activeMenuIcons objectAtIndex:indexPath.row]];
    } else {
        cell.textLabel.font = [menuTitles objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.imageView.image = [UIImage imageNamed:[menuIcons objectAtIndex:indexPath.row]];
    }

    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
