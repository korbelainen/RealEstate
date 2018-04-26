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
