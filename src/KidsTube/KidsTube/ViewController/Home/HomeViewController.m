//
//  HomeViewController.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/6/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "HomeViewController.h"
#import "ListVideoTableViewCell.h"
#import "DataManager.h"
#import "CommonDefine.h"
#import "CommonFunction.h"
#import "DefaultDataManager.h"

NSString * const kListVideoCell = @"ListVideoTableViewCell_ID";

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (nonatomic, strong) NSMutableArray *listVideo;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _listVideo = [[NSMutableArray alloc] init];
    [self showPopUpPasswordWithController:self title:@"" message:MESSGAE_PASSWORD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)getListApiFromYouTube {
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListVideoTableViewCell *cell = (ListVideoTableViewCell *)[self.homeTableView dequeueReusableCellWithIdentifier: kListVideoCell forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height/3;
}

#pragma mark - show popup

- (void)showPopUpPasswordWithController:(UIViewController *)viewController
                                  title:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *submit = [UIAlertAction actionWithTitle:TITLE_SUBMIT style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                       if (alert.textFields.count >  0) {
                                                           
                                                           UITextField *textField = [alert.textFields firstObject];
                                                           if ([DefaultDataManager shareInstance].password != [textField.text integerValue] ||
                                                               textField.text.length !=6) {
                                                               [CommonFunction showPopUpWithController:self title:TITLE_ERROR message:MESSAGE_ERROR_PASSSWORD];
                                                           }
                                                           
                                                       }
                                                       
                                                   }];
    
    [alert addAction:submit];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter password";
        textField.secureTextEntry = YES;
    }];
    
    [viewController presentViewController:alert animated:YES completion:nil];
}


@end
