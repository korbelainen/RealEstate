//
//  WebserviceManager.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "WebserviceManager.h"

static NSString *kGlobalURl = @"https://api.skvortsov.lv/";

@implementation WebserviceManager

static WebserviceManager *sharedInstance = nil;

+ (id)sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[WebserviceManager alloc] init];
    }
    return sharedInstance;
}

- (void)loginWithEmail:(NSString *)email andPassword:(NSString *)password  success:(void (^)(NSDictionary *responseObject))success  {
    NSDictionary *parameters = @{
                                @"email" : email,
                                @"password" : password
                                };


    [self postWithRequestBody:parameters andRequestType:@"login" success:^(NSDictionary *responseObject)  {
        success(responseObject);
    }];
}

- (void)performRegistrationWithUsername:(NSString *)username email: (NSString *)email andPassword:(NSString *)password success:(void (^)(NSDictionary *responseObject))success {
    
    NSDictionary *parameters = @{
                                 @"username" : username,
                                 @"email" : email,
                                 @"password" : password
                                 };
    
    [self postWithRequestBody:parameters andRequestType:@"register" success:^(NSDictionary *responseObject) {
        success(responseObject);
    }];
}

- (void)performLogoutWithSuccess:(void (^)(NSDictionary *responseObject))success {
    // hardcoded parameters
    NSDictionary *parameters = @{
                                 @"app": @"11d623fdee8a4baa8d509f680fa5f9b6",
                                 @"cli": @"a312320606f2438891c7b660aa2f62ac",
                                 @"sess": @"6rnbKKGvLLdU9Sl9"
                                 };
    
    [self postWithRequestBody:parameters andRequestType:@"logout" success:^(NSDictionary *responseObject) {
        success(responseObject);
    }];
}

- (void)performSearchWithParameters:(NSDictionary *)searchParameters success:(void (^)(NSDictionary *responseObject))success {

    //    NSDictionary *cityID = @{ @"$eq": @"mEcFh48791"};
    //    NSDictionary *price = @{
    //                            @"$gte": @0,
    //                            @"$lte": @200000
    //    };
    //    NSDictionary *floor = @{@"$gte": @2};
    //    NSDictionary *rooms = @{
    //                            @"$gte": @1,
    //                            @"$lte": @3
    //                            };
    //    NSDictionary *query = @{
    //                            @"cityId": cityID,
    //                            @"price": price,
    //                            @"floor": floor,
    //                            @"rooms": rooms
    //                            };
    //    NSDictionary *sort = @{@"price": @1};
    NSDictionary *parameters = @{
                                 @"app": @"db8a1b41b8543397a798a181d9891b4c",
                                 @"cli": @"ad6a8fe72ef7dfb9c46958aacb15196a",
                                 @"sess": @"rYgRe6xL2y8VccMJ",
                                 @"coll": @"apartments",
                                 @"limit":@100
                                 };
    [self postWithRequestBody:parameters andRequestType:@"data/find" success:^(NSDictionary *responseObject) {

        success(responseObject);
    }];
}

-(void)postWithRequestBody:(NSDictionary *)body andRequestType:(NSString *)requestType success:(void (^)(NSDictionary *responseObject))success {

    NSURL *url = [NSURL URLWithString:[kGlobalURl stringByAppendingString:requestType]];
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
    success (json);
}

@end
