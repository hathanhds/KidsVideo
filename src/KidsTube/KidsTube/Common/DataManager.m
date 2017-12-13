//
//  DataManager.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/8/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
static DataManager *_instance = nil;


+ (DataManager *)shareInstance {
    if (!_instance) {
        _instance = [[DataManager alloc] init];
    }
    return _instance;
}

/**
 * Function: get request connect to server
 */

- (void) requestGET:(NSString *)URLString
      showIndicator:(BOOL)isShowIndicator
     viewController:(UIViewController *)viewController
            success:(void (^)(NSURLSessionTask *task, id responseObj))success
            failure:(void (^)(NSURLSessionTask *task, NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // show indicater
    
    //    [hud.bezelView setBackgroundColor:[UIColor grayColor]];
    //    hud.mode = MBProgressHUDModeIndeterminate;
    //    hud.bezelView.color = [UIColor clearColor];
    //    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    if (isShowIndicator) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
        [hud showAnimated:YES];
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        // dismiss indicater
        if (isShowIndicator) {
            [MBProgressHUD hideHUDForView:viewController.view animated:YES];
        }
        NSError *error;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error: &error];
        
        if (!error) {
            success(task, result);
            
        }
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(task, error);
        }
        // dismiss indicater
        if (isShowIndicator) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
            [hud showAnimated:YES];
        }
    }];
}

@end
