//
//  UtilitiesManager.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 20/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "UtilitiesManager.h"

@implementation UtilitiesManager

static UtilitiesManager *sharedInstance = nil;

+ (id)sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[UtilitiesManager alloc] init];
    }
    return sharedInstance;
}

+ (NSString *)username {
    return @"";
}

@end
