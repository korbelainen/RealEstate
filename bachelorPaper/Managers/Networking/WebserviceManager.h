//
//  WebserviceManager.h
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Error.h"

@interface WebserviceManager : NSObject

+ (id)sharedInstance;

- (void)loginWithEmail:(NSString *)email andPassword:(NSString *)password  success:(void (^)(NSDictionary *responseObject))success;
- (void)performRegistrationWithUsername:(NSString *)username email: (NSString *)email andPassword:(NSString *)password success:(void (^)(NSDictionary *responseObject))success;
- (void)performLogoutWithSuccess:(void (^)(NSDictionary *responseObject))success;
- (void)performSearchWithParameters:(NSDictionary *)searchParameters success:(void (^)(NSDictionary *responseObject))success;
- (void)getCitiesWithsuccess:(void (^)(NSDictionary *responseObject))success failure:(void (^)(Error *error))failure;
- (void)getStreetsForSelectedCity:(NSString *)city success:(void (^)(NSDictionary *responseObject))success failure:(void (^)(Error *error))failure;
@end
