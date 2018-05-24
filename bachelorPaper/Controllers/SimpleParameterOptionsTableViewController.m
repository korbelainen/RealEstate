//
//  SimpleParameterOptionsTableViewController.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 09/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SimpleParameterOptionsTableViewController.h"
#import "LocalizationSystem.h"

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
    
    cell.textLabel.text = AMLocalizedString([self.options objectAtIndex:indexPath.row], nil);
    
    return cell;
}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"optionCellIdentifier" forIndexPath:indexPath];
    UIImageView *checkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
    [cell.detailTextLabel addSubview: checkImageView];
}

- (void)defineOptions {
    if ([self.selectedParameter isEqualToString:@"heatingType"]) {
        self.options = @[@"any", @"central", @"gas", @"wood"];
    } else {
        self.options = @[@"1", @"2"];
    }

}
@end
