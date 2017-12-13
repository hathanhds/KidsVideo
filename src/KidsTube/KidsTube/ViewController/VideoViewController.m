//
//  VideoViewController.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/21/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "VideoViewController.h"
#import <MBProgressHUD.h>
#import <YTPlayerView.h>

@interface VideoViewController ()<YTPlayerViewDelegate>
@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;

@property (weak, nonatomic) IBOutlet UIButton *bookmarkButton;
@property (weak, nonatomic) IBOutlet UIButton *statusVideoButton;
@property (weak, nonatomic) IBOutlet UIImageView *statusVideoImageView;


@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _playerView.delegate = self;
    [_playerView setBackgroundColor:[UIColor blackColor]];
    NSDictionary *playerVars = @{
                                 @"playsinline" : @1,
                                 };
    [_playerView loadWithVideoId:_videoIdString playerVars:playerVars];
    _starImageView.image = [UIImage imageNamed:@"ic_star"];
    _bookmarkButton.layer.masksToBounds = YES;
    _bookmarkButton.layer.cornerRadius = 8;
    [UIView transitionWithView:_statusVideoImageView
                      duration:1
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _statusVideoImageView.hidden = YES;
                    }
                    completion:NULL];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//- (void)setNavigationButton{
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setFrame:CGRectMake(0, 0, 12.5, 20)];
//    [backButton setBackgroundImage:[UIImage imageNamed:@"ic_arrow_right"] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(backBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    self.navigationItem.leftBarButtonItem = backBarItem;
//}

- (IBAction)backBtnTouched:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)playerViewDidBecomeReady:(YTPlayerView *)playerView{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Playback started" object:self];
    [self.playerView playVideo];
}

- (IBAction)bookmarkBtnTouch:(id)sender {
    if (_bookmarkButton.isSelected) {
        _bookmarkButton.selected = NO;
        _starImageView.image = [UIImage imageNamed:@"ic_star_seleted"];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"Save video";
        hud.margin = 10.f;
        hud.yOffset = 150.f;
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hideAnimated:YES afterDelay:3];
    } else {
        _bookmarkButton.selected = YES;
        _starImageView.image = [UIImage imageNamed:@"ic_star"];
    }
}

- (IBAction)backBtnTouch:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)statusVideoBtnTouch:(id)sender {
    if (_statusVideoButton.isSelected) {
        _statusVideoButton.selected = NO;
        [_playerView pauseVideo];
        //_statusVideoImageView.image = [UIImage imageNamed:@"ic_play"];
        
    } else {
        [_playerView playVideo];
        _statusVideoButton.selected = YES;
        //_statusVideoImageView.image = [UIImage imageNamed:@"ic_pause"];
    }
}


@end
