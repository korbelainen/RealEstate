//
//  SimpleParameterSelectionDelegate.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 31/05/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SimpleParameterOptionsTableViewController;

@protocol SimpleParameterSelectionDelegate <NSObject>

@optional

- (void)simpleParameterSelectedWithValue:(NSString *)value andTitle:(NSString *)title forParameterType:(NSUInteger)type;

@end
