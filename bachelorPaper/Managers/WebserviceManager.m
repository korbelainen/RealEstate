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

@implementation WebserviceManager

static WebserviceManager *sharedWebserviceManager = nil;

+ (id)sharedWebserviceManager {
    if (!sharedWebserviceManager) {
        sharedWebserviceManager = [[WebserviceManager alloc] init];
    }
    return sharedWebserviceManager;
}

- (void)performRegistrationWithUserData:(NSArray *)userData {
    NSDictionary *requestBody = [self createRequestBodyWithValues:userData forRequestType:RegistrationRequest];
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

-(void)postWithRequestBody:(NSDictionary *)body {
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    
//    NSDictionary *dictionary = [self createRequestBodyWithValues:@"" forRequestType: 0];
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:body
                                                   options:kNilOptions error:&error];
    
    if (!error) {
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                       NSLog(@"%@",response);
                                                                       // Handle response here
                                                                   }];
        
        [uploadTask resume];
    }
}

- (NSDictionary *)createRequestBodyWithValues:(NSArray *)values forRequestType:(NSUInteger)type {
    NSMutableDictionary *body = [[NSMutableDictionary alloc]init];
    
    switch (type) {
        case RegistrationRequest: {
//            [body setObject:<#(nonnull id)#> forKey:<#(nonnull id<NSCopying>)#>]
        }
        case LoginRequest: {
            
        }
        case LogoutRequest: {
            
        }
        default:
            break;
    }
    
    return body;
}
@end
