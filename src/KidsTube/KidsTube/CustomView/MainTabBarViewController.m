//
//  MainTabBarViewController.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/4/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "TabBarView.h"
#import "HomeViewController.h"
#import "BookmarkViewController.h"
#import "HistoryViewController.h"
#import "SearchViewController.h"
#import "SettingViewController.h"
#import "UIStoryboard+KidsTube.h"
#import "CommonDefine.h"

@interface MainTabBarViewController ()

@property (nonatomic, strong) TabBarView *tabbarView;


@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubView];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.tabBar bringSubviewToFront:self.tabbarView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

/**
 * Add all subview to tabbar
 */

- (void)addSubView {
    {
        UINavigationController *navi = [[UIStoryboard homeStoryboard] instantiateInitialViewController];
        [self addChildViewController:navi];
        //navi.interactivePopGestureRecognizer.enabled = NO;
    }
    
    {
        UINavigationController *navi = [[UIStoryboard bookmarkStoryboard] instantiateInitialViewController];
        [self addChildViewController:navi];
        //navi.interactivePopGestureRecognizer.enabled = NO;
    }
    
    {
        UINavigationController *navi = [[UIStoryboard historyStoryboard] instantiateInitialViewController];
        [self addChildViewController:navi];
        //navi.interactivePopGestureRecognizer.enabled = NO;
    }
    
    {
        UINavigationController *navi = [[UIStoryboard searchStoryboard] instantiateInitialViewController];
        [self addChildViewController:navi];
        //navi.interactivePopGestureRecognizer.enabled = NO;
    }
    
    {
        UINavigationController *navi = [[UIStoryboard settingStoryboard] instantiateInitialViewController];
        [self addChildViewController:navi];
        //navi.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [self setUpTabbar];
}

/**
 * Set up layout tabbar
 */

- (void)setUpTabbar {
    self.tabbarView = [[TabBarView alloc] initWithOwner:self frame:self.tabBar.bounds];
    [self.tabBar addSubview:self.tabbarView];
    [self.tabBar bringSubviewToFront:self.tabbarView];
    self.tabBar.clipsToBounds = NO;
    [self.tabbarView setDefaultSelectedTab];
}

/**
 *  Action select tab in bottom screen
 *
 *  @param sender : information tab selected
 */
- (IBAction)tabBarMainAction:(id)sender {
    NSInteger indexTab = [sender tag] - BASE_TAG;
    self.selectedIndex = indexTab;
//    UINavigationController *nav = [self viewControllers][indexTab];
//    //[nav popToRootViewControllerAnimated:YES];
//    
//    CGFloat heighStatusBar = HEIGHT_STATUS_BAR;
//    CGRect frame = CGRectMake(0, SCREEN_HEIGHT_PORTRAIT - HEIGHT_TABBAR, SCREEN_WIDTH_PORTRAIT, HEIGHT_TABBAR);
    CGRect frame = CGRectMake(0, self.view.frame.size.height - self.tabbarView.frame.size.height, self.view.frame.size.width, self.tabbarView.frame.size.height);
    self.tabBar.hidden = NO;
    [self.tabBar setFrame:frame];
}


@end
