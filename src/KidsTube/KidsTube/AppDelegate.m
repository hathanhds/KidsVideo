//
//  AppDelegate.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/2/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "AppDelegate.h"
#import "CommonDefine.h"
#import "HomeViewController.h"
#import "MainTabBarViewController.h"
#import "UIStoryboard+KidsTube.h"

NSString * const kHomeViewController = @"HomeViewController_ID";
NSString * const kMainTabBarController = @"MainTabBarViewController_ID";

@interface AppDelegate ()<UINavigationControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initNavigationLayout];
    MainTabBarViewController *homeVC = [[UIStoryboard tabBarStoryboard] instantiateViewControllerWithIdentifier:kMainTabBarController];
    UINavigationController *navCtrlr = [[UINavigationController alloc]initWithRootViewController: homeVC];
    
    [self.window setRootViewController:navCtrlr];
    navCtrlr.delegate = self;
    navCtrlr.navigationBarHidden = NO;
    
    NSError* configureError;
    [[GGLContext sharedInstance] configureWithError: &configureError];
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);

    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:sourceApplication
                                      annotation:annotation];
}

- (void) initNavigationLayout {
    [UINavigationBar appearance].translucent = false;
    [[UINavigationBar appearance] setBarTintColor:[UIColor purpleColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           nil]];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
