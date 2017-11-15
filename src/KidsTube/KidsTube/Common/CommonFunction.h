//
//  CommonFunction.h
//  KidsTube
//
//  Created by Xuan Xuxu on 11/13/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonFunction : NSObject

+ (CommonFunction *)shareInstace;

+ (void)showPopUpWithController: (UIViewController *)viewController
                          title: (NSString *)title
                        message:(NSString *)message;

@end
