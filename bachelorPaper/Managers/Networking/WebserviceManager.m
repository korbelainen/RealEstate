//
//  WebserviceManager.m
//  bachelorPaper
//
//  Created by Lily Kazutina on 05/04/2018.
//  Copyright © 2018 TSI. All rights reserved.
//

#import "WebserviceManager.h"

static NSString *kGlobalURl = @"https://app.skvortsov.lv/api/";

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
    NSString *url = [kGlobalURl stringByAppendingString:@"find/apartments?"];
    [url stringByAppendingString:[self prepareSearchParametersFromDictionary:searchParameters]];
    [self getWithUrl:url success:^(NSDictionary *responseObject) {
        success(responseObject);
    } failure:^(Error *error) {
        NSLog(@"%@", error.message);
    }];
}

- (NSString *)prepareSearchParametersFromDictionary:(NSDictionary *)dictionary {
    NSString *parameters = @"";

    for (NSDictionary *item in dictionary) {
        [parameters stringByAppendingString:[NSString stringWithFormat:@"%@",item]];
    }

    return parameters;
}

- (void)getStreetsForSelectedCity:(NSString *)city success:(void (^)(NSDictionary *responseObject))success failure:(void (^)(Error *error))failure {
    NSString *url = [[kGlobalURl stringByAppendingString:@"find/streets?city_id="] stringByAppendingString:city];
    [self getWithUrl:url success:^(NSDictionary *responseObject) {
        success(responseObject);
    } failure:^(Error *error) {
        NSLog(@"%@", error.message);
    }];
}

- (void)getCitiesWithsuccess:(void (^)(NSDictionary *responseObject))success failure:(void (^)(Error *error))failure {

    [self getWithUrl:[kGlobalURl stringByAppendingString: @"find/cities"] success:^(NSDictionary *responseObject) {
        success(responseObject);
    } failure:^(Error *error) {
        NSLog(@"%@", error.message);
    }];
}

- (void)getWithUrl:(NSString *)url success:(void (^)(NSDictionary *responseObject))success failure:(void (^)(Error *error))failure {

    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];

    [request setHTTPMethod:@"GET"];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dataJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
           success(dataJSON);

    }];
    [dataTask resume];
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
