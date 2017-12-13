//
//  HistoryViewController.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/30/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryTableViewCell.h"

NSString * const kHistoryTableCell = @"HistoryTableViewCell_ID";

@interface HistoryViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *historyTableView;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"History";
    // Do any additional setup after loading the view.
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

#pragma mark - UItableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryTableViewCell *cell = (HistoryTableViewCell *)[_historyTableView dequeueReusableCellWithIdentifier:kHistoryTableCell forIndexPath:indexPath];
    
    return cell;
}

@end
