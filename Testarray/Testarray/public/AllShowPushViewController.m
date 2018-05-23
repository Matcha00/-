//
//  AllShowPushViewController.m
//  Testarray
//
//  Created by feirui on 2018/5/23.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "AllShowPushViewController.h"
#import "AllShowTableViewCell.h"
@interface AllShowPushViewController ()
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;

@end

@implementation AllShowPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupTableViewHeard];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupTableViewHeard
{
    UIView *header = [[UIView alloc]init];
    AllShowTableViewCell *cell = [AllShowTableViewCell cell];
    
    [header addSubview:cell];
    
    self.commentTableView.tableHeaderView = header;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
