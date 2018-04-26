//
//  WebserviceManager.h
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebserviceManager : NSObject

+ (id)sharedInstance;

- (void)loginWithEmail:(NSString *)email andPassword:(NSString *)password  success:(void (^)(NSDictionary *responseObject))success;
- (void)performRegistrationWithUsername:(NSString *)username email: (NSString *)email andPassword:(NSString *)password success:(void (^)(NSDictionary *responseObject))success;

@end
