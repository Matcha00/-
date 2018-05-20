//
//  StudyAbroadViewTabBarController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/20.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "StudyAbroadViewTabBarController.h"
#import "StudyAbroadNavigationController.h"
#import "HomePageViewController.h"
#import "MeViewController.h"
#import "MessageViewController.h"
#import "NearbyViewController.h"
@interface StudyAbroadViewTabBarController ()

@end

@implementation StudyAbroadViewTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupChildVc:[[HomePageViewController alloc]init] title:@"首页" image:@"homepage" seleimage:nil];
    [self setupChildVc:[[NearbyViewController alloc]init] title:@"附近" image:@"bearby" seleimage:nil];
    [self setupChildVc:[[MessageViewController alloc]init] title:@"消息" image:@"message" seleimage:nil];
    [self setupChildVc:[[MeViewController alloc]init] title:@"我" image:@"me" seleimage:nil];
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
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image seleimage:(NSString *)seleimage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:seleimage];
    
    StudyAbroadNavigationController *nav = [[StudyAbroadNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}
@end
