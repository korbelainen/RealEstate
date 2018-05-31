//
//  Error.h
//  bachelorPaper
//
//  Created by Lilija Kazutina on 31/05/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Error : NSObject

@property (nonatomic) NSString *message;
@property (nonatomic) NSInteger httpCode;

- (id)initWithResponce:(NSDictionary *)error;

@end
