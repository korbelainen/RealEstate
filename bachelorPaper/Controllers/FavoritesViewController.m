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
#import "WebserviceManager.h"
#import "ApartmentDetailsTableViewController.h"

@interface FavoritesViewController ()

@property (strong, nonatomic) NSArray *favorites;
@property (assign, nonatomic) NSInteger selectedApartmentIndex;

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
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FavoritesListItemTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FavoritesListItemTableViewCellIdentifier" forIndexPath:indexPath];
    NSDictionary *apartmentParameters = [self.favorites objectAtIndex:indexPath.row];
    NSArray *apartmentPhotos = apartmentParameters[@"photos"];
    if (apartmentPhotos.count > 0) {
        cell.appartmentPhotosImaveView.image = [UIImage imageWithData:[[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [apartmentPhotos objectAtIndex:0]]]];
    } else {}
    
    cell.priceLabel.text = [apartmentParameters[@"price"] stringByAppendingString:@" €"];
    NSString *square = [NSString stringWithFormat:@"%@", apartmentParameters[@"square"]];
    NSString *city = [NSString stringWithFormat:@"%@", apartmentParameters[@"city"]];
    NSString *district = [NSString stringWithFormat:@"%@", apartmentParameters[@"district"]];
    NSString *street = [NSString stringWithFormat:@"%@", apartmentParameters[@"street"]];
    NSString *houseNumber = [NSString stringWithFormat:@"%@", apartmentParameters[@"houseNr"]];
    cell.addressLabel.text = [[[[[[city stringByAppendingString:@", "] stringByAppendingString:district] stringByAppendingString:@", "] stringByAppendingString:street]stringByAppendingString:@" "]stringByAppendingString:houseNumber];
    cell.sizeLabel.text = [square stringByAppendingString:@" m2, "];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        self.selectedApartmentIndex = indexPath.row;
    [self performSegueWithIdentifier:@"apartmentDetailsSegueIdentifier" sender:nil];
}

- (void)getFavorites {

    NSDictionary *inputParameters = [NSDictionary dictionaryWithObjectsAndKeys:@1, @"balcony", nil];

    [[WebserviceManager sharedInstance] performSearchWithParameters:inputParameters success:^(NSArray *responseObject) {
        self.favorites = responseObject;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (NSString *)createHeaderTitleForSearchItemAtIndexPath: (NSIndexPath *)indexPath forController:(BOOL) willBeUsedAsControllerTitle {

    NSString *square = [NSString stringWithFormat:@"%@", [[self.favorites objectAtIndex:indexPath.row] valueForKey:@"square"]];
    NSString *city = [NSString stringWithFormat:@"%@", [[self.favorites objectAtIndex:indexPath.row] valueForKey:@"city"]];
    NSString *district = [NSString stringWithFormat:@"%@", [[self.favorites objectAtIndex:indexPath.row] valueForKey:@"district"]];
    NSString *street = [NSString stringWithFormat:@"%@", [[self.favorites objectAtIndex:indexPath.row] valueForKey:@"street"]];
    NSString *houseNumber = [NSString stringWithFormat:@"%@", [[self.favorites objectAtIndex:indexPath.row] valueForKey:@"houseNr"]];

    if (willBeUsedAsControllerTitle == YES) {
        return [[[[[[city stringByAppendingString:@", "] stringByAppendingString:district] stringByAppendingString:@", "] stringByAppendingString:street]stringByAppendingString:@" "]stringByAppendingString:houseNumber];
    } else {
        return [[[[[[[[square stringByAppendingString:@" m2, "] stringByAppendingString:city] stringByAppendingString:@", "] stringByAppendingString:district] stringByAppendingString:@", "] stringByAppendingString:street]stringByAppendingString:@" "]stringByAppendingString:houseNumber];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"apartmentDetailsSegueIdentifier"]) {
        ((ApartmentDetailsTableViewController *)segue.destinationViewController).apartmentDetails = [self.favorites objectAtIndex: self.selectedApartmentIndex];
        ((ApartmentDetailsTableViewController *)segue.destinationViewController).address = [self createHeaderTitleForSearchItemAtIndexPath:[NSIndexPath indexPathForRow:self.selectedApartmentIndex inSection:0] forController:YES];
        ((ApartmentDetailsTableViewController *)segue.destinationViewController).isInFavorites = YES;

    }
}

@end
