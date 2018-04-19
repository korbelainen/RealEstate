//
//  WebserviceManager.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "WebserviceManager.h"

typedef enum {
    RegistrationRequest = 0,
    LoginRequest        = 1,
    LogoutRequest       = 2
    
} RequestTypes;

static NSString *kGlobalURl = @"https://api.skvortsov.lv/";

@implementation WebserviceManager

static WebserviceManager *sharedWebserviceManager = nil;

+ (id)sharedWebserviceManager {
    if (!sharedWebserviceManager) {
        sharedWebserviceManager = [[WebserviceManager alloc] init];
    }
    return sharedWebserviceManager;
}

- (void)loginWithEmail:(NSString *)email andPassword:(NSString *)password {

    NSDictionary *loginBody = @{
                                @"email" : email,
                                @"password" : password
                                };

    [self postWithRequestBody:loginBody andRequestType:@"login"];
}

- (void)performRegistrationWithUserData:(NSArray *)userData {
//    {
//        "app": "11d623fdee8a4baa8d509f680fa5f9b6",
//        "cli": "a312320606f2438891c7b660aa2f62ac",
//        "username": "lk",
//        "email": "lia@gmail.com",
//        "password": "Password123",
//        "doc": {
//            "phone": "+37125501010"
//        }
//    }
}

-(void)login:(NSString *)email password:(NSString *)password success:
(void(^)())postSuccess
failedWithError:(void(^)(Error *error))failedWithError{
    NSDictionary *parameters = @{@"email" : email,
                                 @"password" : password};

    NSString *url = [kGlobalURl stringByAppendingString:@"login"];

    [self postWithRequestBody:parameters andRequestType:@"login" success:^(NSDictionary *responseObject) {
        if(postSuccess){
            postSuccess(responseObject);
        }
    }failure:^(Error *error){
        NSLog(@"%@", error);
    }];
}


- (void)login:(NSString *)email password:(NSString *)password success:
(void(^)())postSuccess
failedWithError:(void(^)(Error *error))failedWithError {
    NSDictionary *parameters = @{@"email" : email,
                                 @"password" : password};

    [self postWithRequestBody:parameters andRequestType:@"login" success:^(NSDictionary *responseObject){
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                success(responseObject[@"response"]);
            });
        }

    } failure:^(Error *error){
        NSLog(@"%@", error);
    }];
}



-(void)postWithRequestBody:(NSDictionary *)body andRequestType:(NSString *)requestType
                   success:(void (^)(NSDictionary *responseObject))success {

    NSURL *url = [NSURL URLWithString:[apiAddress stringByAppendingString:requestType]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";

    NSData *data = [NSJSONSerialization dataWithJSONObject:body
                                                   options:kNilOptions error:nil];

    request.HTTPBody = data;

    [request setValue:@"text/json" forHTTPHeaderField:@"Content-Type"];
    NSURLResponse * response = nil;
    NSError * NSURLRequestError = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request
                                                  returningResponse:&response
                                                              error:&NSURLRequestError];
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];

    success(json);
}

@end
