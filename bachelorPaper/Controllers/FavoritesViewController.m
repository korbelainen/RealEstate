//
//  FavoritesViewController.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 22/03/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "FavoritesViewController.h"
#import "LocalizationSystem.h"
#import "FavoritesListItemTableViewCell.h"

@interface FavoritesViewController ()

@property (strong, nonatomic) NSArray *favorites;

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = AMLocalizedString(@"favorites", nil);
    [self getFavorites];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.favorites.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 239;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FavoritesListItemTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FavoritesListItemTableViewCellIdentifier" forIndexPath:indexPath];
    NSArray *apartmentParameters = [self.favorites objectAtIndex:indexPath.row];
    cell.appartmentPhotosImaveView.image = [UIImage imageNamed:[apartmentParameters objectAtIndex:0]];
    cell.priceLabel.text = [apartmentParameters objectAtIndex:1];
    cell.addressLabel.text = [apartmentParameters objectAtIndex:2];
    cell.sizeLabel.text = [apartmentParameters objectAtIndex:3];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"apartmentDetailsSegueIdentifier" sender:nil];
}

- (void)getFavorites {
     self.favorites = @[@[@"camera", @"50 000", @"Baker street 221b", @"45 m2"], @[@"camera", @"70 000", @"Medison square gardens", @"64 m2"]];
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
