//
//  HomePageViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/20.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "HomePageViewController.h"
#import "ShowViewController.h"
#import "AllTwoTableViewController.h"
@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fzClick:(id)sender {
    
    ShowViewController *show = [[ShowViewController alloc]init];
    
    [self.navigationController pushViewController:show animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)wupinPush:(id)sender {
    
    AllTwoTableViewController *allVc = [[AllTwoTableViewController alloc]init];
    [self.navigationController pushViewController:allVc animated:YES];
}

- (IBAction)studyPush:(id)sender {
    
    AllTwoTableViewController *allVc = [[AllTwoTableViewController alloc]init];
    [self.navigationController pushViewController:allVc animated:YES];
}
@end
