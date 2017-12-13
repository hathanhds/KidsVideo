//
//  CommonFunction.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/13/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "CommonFunction.h"
#import "CommonDefine.h"

static CommonFunction *_instance = nil;

@implementation CommonFunction

+ (CommonFunction *)shareInstace {
    if (!_instance) {
        _instance = [[CommonFunction alloc] init];
    }
    return _instance;
}

+ (void)showPopUpWithController: (UIViewController *)viewController
                          title: (NSString *)title
                        message:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {
                                                    
                                                }];
    [alert addAction:yes];
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alert animated:YES completion:nil];
    });
}



@end
