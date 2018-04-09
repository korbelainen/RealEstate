//
//  SimpleParameterOptionsTableViewController.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 09/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "SimpleParameterOptionsTableViewController.h"

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
    
    cell.textLabel.text = [self.options objectAtIndex:indexPath.row];
    
    return cell;
}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"optionCellIdentifier" forIndexPath:indexPath];
    UIImageView *checkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
    [cell.detailTextLabel addSubview: checkImageView];
}

- (void)defineOptions {
    
    self.options = @[@"1", @"2"];
    
//    @[@"Жилая", @"Коммерческая", @"Дачи,участки", @"Гаражи,парковки", @"Земля"];
//    @[@"Любой", @"Комнаты", @"Вторичка", @"Новостройки", @"Коттеджи, дома"];
//    @[@"Любой", @"Бизнес", @"Комфорт", @"Эконом", @"Элитный"];
//    @[@"Любая", @"Другое", @"Изолированная", @"Свободная", @"Смежная", @"Смежно-изоблированная"];

}
@end
