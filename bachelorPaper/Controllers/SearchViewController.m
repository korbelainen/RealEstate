//
//  ViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 22/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SearchViewController.h"
#import "LocalizationSystem.h"
#import "SegmentedControlTableViewCell.h"

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearBarButton;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *language = [defaults objectForKey:@"language"];
    if([language isEqualToString:@"lv"]){
        LocalizationSetLanguage(@"lv");
        [self changeLanguage];
    }else if ([language isEqualToString:@"ru"]){
        LocalizationSetLanguage(@"ru");
        [self changeLanguage];
    }

    self.title = AMLocalizedString(@"search", nil);
    [self.clearBarButton setTitle:AMLocalizedString(@"clear", nil)];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    switch (indexPath.section) {
//        case 0: {
            SegmentedControlTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SegementedControlCellIdentifier" forIndexPath:indexPath];
            return cell;
//        }
//        break;
//
//        default:
//            return UITableViewCell;
//    }
}

- (IBAction)openMenu:(id)sender {
}

- (IBAction)setRussian:(id)sender {
    LocalizationSetLanguage(@"ru");
    [self changeLanguage];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"ru" forKey:@"language"];

}

- (IBAction)setLatvian:(id)sender {
    LocalizationSetLanguage(@"lv");
    [self changeLanguage];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"lv" forKey:@"language"];

}

-(void)changeLanguage
{
//    self.welcomeMessage.text = AMLocalizedString(@"description", nil);
//    [self.startButton setTitle:AMLocalizedString(@"start_button", nil) forState:UIControlStateNormal];
//    [self.startButton setTitle:AMLocalizedString(@"start_button", nil) forState:UIControlStateHighlighted];
}
@end
