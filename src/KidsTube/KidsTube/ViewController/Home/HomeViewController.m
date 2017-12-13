//
//  HomeViewController.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/6/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "HomeViewController.h"
#import "ListVideoTableViewCell.h"
#import "VideoViewController.h"
#import "DataManager.h"
#import "CommonDefine.h"
#import "CommonFunction.h"
#import "DefaultDataManager.h"
#import "ConfigApp.h"
#import "UIStoryboard+KidsTube.h"

NSString * const kListVideoCell = @"ListVideoTableViewCell_ID";
NSString * const kKey = @"pass_word";
NSString * const kVideoViewController = @"VideoViewController_ID";

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (nonatomic, copy) NSMutableArray *listImageVideo;
@property (nonatomic, copy) NSMutableArray *listTitle;
@property (nonatomic, copy) NSMutableArray *listVideoId;
@property (nonatomic, strong) NSString *channelIDString;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _listImageVideo = [[NSMutableArray alloc] init];
    _listTitle = [[NSMutableArray alloc] init];
    _listVideoId = [[NSMutableArray alloc] init];
    self.navigationItem.title = @"Home";
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(6 , 0, -6, 0);
    [self showPopUpPasswordWithController:self title:@"" message:MESSGAE_PASSWORD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[self getAPIChannelsYoutube];
    [self getAPIChannelsYoutube];
}

- (void)getAPIChannelsYoutube {
    NSString *urlChannelString = [NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/channels?part=contentDetails,snippet&id=%@&key=%@",CHANNEL_ID,API_KEY];
    NSString *urlPlayList = [NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/playlistItems?playlistId=%@&key=%@&part=snippet&maxResults=50",@"UUpsXRs8ZlK-nBRj05CmLSgg", API_KEY];
    [[DataManager shareInstance] requestGET:urlPlayList
                              showIndicator:YES
                             viewController:self
                                    success:^(NSURLSessionTask *task, id responseObj) {
                                        NSLog(@"RESPONSE: %@", responseObj);
                                        NSArray *data = responseObj[@"items"];
                                        if (data.count > 0) {
//                                            NSDictionary *dict = data[0];
//                                            NSDictionary *contentDetails = dict[@"contentDetails"][@"relatedPlaylists"];
//                                            _channelIDString = contentDetails[@"uploads"];
                                            for (int i = 0; i < data.count; i++) {
                                                NSDictionary *dict = data[i][@"snippet"];
                                                NSString *title = dict[@"title"];
                                                [_listTitle addObject:title];
                                                NSDictionary *videoImage = dict[@"thumbnails"][@"standard"];
                                                NSString *urlImage = videoImage[@"url"];
                                                [_listImageVideo addObject:urlImage];
                                                NSDictionary *videoId = dict[@"resourceId"];
                                                NSString *videoIdString = videoId[@"videoId"];
                                                [_listVideoId addObject:videoIdString];
                                            }
                                        }
                                        [_homeTableView reloadData];
                                    } failure:^(NSURLSessionTask *task, NSError *error) {
                                        NSLog(@"%@", error.description);
                                    }];
}

- (void)getAPIPlayListlVideo {
    NSString *urlListChannelString = [NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/playlistItems?playlistId=%@&key=%@&part=snippet&maxResults=50",@"UUpsXRs8ZlK-nBRj05CmLSgg", API_KEY];
    [[DataManager shareInstance] requestGET:urlListChannelString
                              showIndicator:YES
                             viewController:self
                                    success:^(NSURLSessionTask *task, id responseObj) {
                                        NSLog(@"Play list: %@", responseObj);
                                        NSArray *data = responseObj[@"items"];
                                        if (data.count > 0) {
                                            for (int i = 0; i < data.count; i++) {
                                                NSDictionary *dict = data[3];
                                                NSString *title = dict[@"title"];
                                                [_listTitle addObject:title];
                                                NSDictionary *videoImage = dict[@"thumbnails"][@"maxres"];
                                                NSString *urlImage = videoImage[@"url"];
                                                [_listImageVideo addObject:urlImage];
                                                
                                            }
                                        }
                                        [_homeTableView reloadData];
                                    } failure:^(NSURLSessionTask *task, NSError *error) {
                                        NSLog(@"%@", error.description);
                                    }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_listTitle count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListVideoTableViewCell *cell = (ListVideoTableViewCell *)[self.homeTableView dequeueReusableCellWithIdentifier: kListVideoCell forIndexPath:indexPath];
    cell.titleLabel.text = [_listTitle objectAtIndex:indexPath.row];
    NSURL *imageURLString = [NSURL URLWithString:[_listImageVideo objectAtIndex:indexPath.row ]];
    NSData *data = [NSData dataWithContentsOfURL: imageURLString];
    cell.avatarImageView.image = [UIImage imageWithData:data];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.view.frame.size.height/3;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoViewController *videoController = [[UIStoryboard videoStoryboard] instantiateViewControllerWithIdentifier:kVideoViewController];
    videoController.videoIdString = [_listVideoId objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:videoController animated:YES];
    
}

#pragma mark - show popup

- (void)showPopUpPasswordWithController:(UIViewController *)viewController
                                  title:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *submit = [UIAlertAction actionWithTitle:TITLE_SUBMIT style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                            
                                                       if (alert.textFields.count >0) {
                                                           
                                                           UITextField *textField = [alert.textFields firstObject];
                                                           NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
                                                           
                                                           if (textField.text.length == 6) {
                                                               if (![[standard objectForKey:kKey] isKindOfClass:[NSNull class]]) {
                                                                   [standard setObject:textField.text forKey:kKey];
                                                                   [_homeTableView reloadData];
                                                               } else if (![[standard objectForKey:kKey] isEqualToString:textField.text]){
                                                                       [viewController presentViewController:alert animated:YES completion:nil];
                                                               } else {
                                                                   
                                                               }
                                                           } else {
                                                               [viewController presentViewController:alert animated:YES completion:nil];
                                                           }
                                                           
                                                       }
                                                       
                                                   }];
    
    [alert addAction:submit];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter password";
        textField.secureTextEntry = YES;
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    [viewController presentViewController:alert animated:YES completion:nil];
}

@end
