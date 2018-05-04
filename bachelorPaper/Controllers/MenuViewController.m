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
#import "MailManager.h"

static NSArray *menuIcons;
static NSArray *activeMenuIcons;
static NSArray *menuTitles;

@interface MenuViewController ()

@property (assign, nonatomic) NSInteger activeMenuItem;
@property (assign, nonatomic) BOOL isLoggedIn;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *language = [defaults objectForKey:@"language"];
    if([language isEqualToString:@"lv"]){
        LocalizationSetLanguage(@"lv");
    } else if ([language isEqualToString:@"ru"]){
        LocalizationSetLanguage(@"ru");
    } else if ([language isEqualToString:@"en-US"]) {
          LocalizationSetLanguage(@"en-US");
    }
    
    self.activeMenuItem = 0;
    self.isLoggedIn = [[NSUserDefaults standardUserDefaults]boolForKey:@"isLoggedIn"];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.0];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

+ (void)initialize
{
    menuIcons = @[@"white-user_male_circle",
                  @"white-search",
                  @"white-bookmark",
                  @"white-star",
                  @"white-documents",
                  @"white-plus",
                  @"white-message",
                  @"russian",
                  @"latvian",
                  @"english"];
    
    activeMenuIcons = @[@"red-user_male_circle",
                        @"red-search",
                        @"red-bookmark",
                        @"red-star",
                        @"red-documents",
                        @"red-plus",
                        @"red-message",
                        @"russian",
                        @"latvian",
                        @"english"];
    
    menuTitles = @[AMLocalizedString(@"login", nil),
                   AMLocalizedString(@"advertisement_search", nil),
                   AMLocalizedString(@"saved_searches", nil),
                   AMLocalizedString(@"favorites", nil),
                   AMLocalizedString(@"my_advertisements", nil),
                   AMLocalizedString(@"add_advertisement", nil),
                   AMLocalizedString(@"feedback", nil),
                   @"По-русски",
                   @"Latviski",
                   @"English"
                   ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return menuIcons.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 54;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuItemCellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.0];
    
    if (self.activeMenuItem == indexPath.row) {
        cell.menuItemLabel.text = AMLocalizedString([menuTitles objectAtIndex:indexPath.row], nil);
        cell.menuItemLabel.textColor = [UIColor colorWithRed:0.95 green:0.22 blue:0.27 alpha:1.0];
        cell.menuItemIcon.image = [UIImage imageNamed:[activeMenuIcons objectAtIndex:indexPath.row]];
    } else {
        cell.menuItemLabel.text = AMLocalizedString([menuTitles objectAtIndex:indexPath.row], nil);
        cell.menuItemLabel.textColor = [UIColor whiteColor];
        cell.menuItemIcon.image = [UIImage imageNamed:[menuIcons objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.activeMenuItem = indexPath.row;
    
    if (indexPath.row == 0) {
        if (self.isLoggedIn == YES) {
            [self performSegueWithIdentifier:@"showUserProfile" sender:nil];
        }
    } else if (indexPath.row == 6) {
        MailManager *mailManager = [[MailManager alloc]init];
        [mailManager sendFeedback];
    } else if (indexPath.row == 7) {
        LocalizationSetLanguage(@"ru");
    } else if (indexPath.row == 8) {
        LocalizationSetLanguage(@"lv");
    } else if (indexPath.row == 9) {
         LocalizationSetLanguage(@"en-US");
    }
    [self.tableView reloadData];
}

@end
