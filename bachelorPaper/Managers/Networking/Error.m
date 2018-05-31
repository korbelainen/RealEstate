//
//  Error.m
//  bachelorPaper
//
//  Created by Lilija Kazutina on 31/05/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "Error.h"

NSString * const kErrorMessage = @"message";

@implementation Error

- (id)initWithResponce:(NSDictionary *)error {
    if (self = [super init]) {
        self.message = [error valueForKey:kErrorMessage];
    }
    return(self);
}

@end
