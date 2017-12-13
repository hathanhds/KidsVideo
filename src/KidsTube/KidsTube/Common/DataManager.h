//
//  DataManager.h
//  KidsTube
//
//  Created by Xuan Xuxu on 11/8/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <MBProgressHUD.h>

@interface DataManager : NSObject

+ (DataManager *)shareInstance;

- (void) requestGET:(NSString *)URLString
      showIndicator:(BOOL)isShowIndicator
     viewController:(UIViewController *)viewController
            success:(void (^)(NSURLSessionTask *task, id responseObj))success
            failure:(void (^)(NSURLSessionTask *task, NSError *error))failure;

@end
