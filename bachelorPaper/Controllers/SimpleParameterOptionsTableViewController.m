//
//  SimpleParameterOptionsTableViewController.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 09/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SimpleParameterOptionsTableViewController.h"
#import "SimpleParameterSelectionDelegate.h"
#import "LocalizationSystem.h"
#import "WebserviceManager.h"
#import "SearchViewController.h"

@interface SimpleParameterOptionsTableViewController ()

@property (strong, nonatomic) NSArray *options;

@end

@implementation SimpleParameterOptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defineOptions];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"optionCellIdentifier" forIndexPath:indexPath];
    if ([self.selectedParameter isEqualToString:@"street"]) {
        cell.textLabel.text = [[self.options objectAtIndex:indexPath.row] valueForKey:@"name"];
    } else if ([self.selectedParameter isEqualToString:@"city"]) {
        cell.textLabel.text = [[self.options objectAtIndex:indexPath.row] valueForKey:@"name"];
    } else {
        cell.textLabel.text = AMLocalizedString([self.options objectAtIndex:indexPath.row], nil);
    }
    return cell;
}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"optionCellIdentifier" forIndexPath:indexPath];
    UIImageView *checkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
    [cell.detailTextLabel addSubview: checkImageView];

    NSInteger parameterType = -1;

    if ([self.selectedParameter isEqualToString:@"street"]) {
        parameterType = 0;

    } else if ([self.selectedParameter isEqualToString:@"district"]){
        parameterType = 1;
    } else if ([self.selectedParameter isEqualToString:@"city"]){
        parameterType = 2;
    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(simpleParameterSelectedWithValue:andTitle:forParameterType:)]) {
        [self.delegate simpleParameterSelectedWithValue:[[self.options objectAtIndex:indexPath.row] valueForKey:@"id"] andTitle:[[self.options objectAtIndex:indexPath.row] valueForKey:@"name"] forParameterType:parameterType];
    }
}

- (void)defineOptions {
    NSLog(@"%@", self.selectedParameter);
    if ([self.selectedParameter isEqualToString:@"street"]) {
        [[WebserviceManager sharedInstance] getStreetsForSelectedCity:@"1" success:^(NSArray *responseObject) {
            self.options = responseObject;
            dispatch_async(dispatch_get_main_queue(), ^ {
                [self.tableView reloadData];
            });
        } failure:^(Error *error) {
            NSLog(@"%@", error.message);
        }];
    } else if ([self.selectedParameter isEqualToString:@"city"]) {
        [[WebserviceManager sharedInstance] getCitiesWithsuccess:^(NSArray *responseObject) {
            self.options = responseObject;
            dispatch_async(dispatch_get_main_queue(), ^ {
                [self.tableView reloadData];
            });
        } failure:^(Error *error) {
            NSLog(@"%@", error.message);
        }];
    }
//    else if ([self.selectedParameter isEqualToString:@"heatingType"]) {
//        self.options = @[@{@"name" : @"any", @"id" : @"1"}, @{@"name" : @"central", @"id" : @"2"}, @{@"name" : @"gas", @"id" : @"3"}, @{@"name" : @"wood", @"id" : @"4"}];
//        [self.tableView reloadData];
//    }
}
@end
