//
//  ApartmentDetailsTableViewController.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 07/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "ApartmentDetailsTableViewController.h"

@interface ApartmentDetailsTableViewController ()

@property (strong, nonatomic) NSString *address;

@end

@implementation ApartmentDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.address;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
   UIBarButtonItem *favoritesButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(manageFavorites:)];
    favoritesButton.image = [UIImage imageNamed:@"add_to_favorites"];
     self.navigationItem.rightBarButtonItem = favoritesButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 6;
        case 1:
            return 1;
        case 2:
            return 1;
        case 3:
            return 1;
        case 4:
            return 2;
        case 5:
            return 1;
            
        default:
            return 0;
    }
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
     switch (indexPath.section) {
         case 0: {
             switch (indexPath.row) {
                 case 0: {
                     
                 }
                 case 1: {
                     
                 }
                 case 2: {
                     
                 }
                     
                 default:
                     break;
             }
         }
         default:
             break;
     }
 return cell;
 }

- (void)manageFavorites: (UIButton *)sender {
    NSLog(@"!!!");
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
