//
//  SearchViewController.m
//  KidsTube
//
//  Created by Xuan Xuxu on 11/6/17.
//  Copyright © 2017 gamota. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"

NSString * kSearchTableCell = @"SearchTableViewCell_ID";

@interface SearchViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Search";
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchTableViewCell *cell = (SearchTableViewCell *)[_searchTableView dequeueReusableCellWithIdentifier:kSearchTableCell forIndexPath:indexPath];
    
    return cell;
}

@end
