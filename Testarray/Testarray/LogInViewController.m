//
//  LogInViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/20.
//  Copyright © 2018年 陈欢. All rights reserved.
//
#define keyName   @"name"

#import "LogInViewController.h"
#import "UserInfo.h"
#import "CHDBTool.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "StudyAbroadViewTabBarController.h"
@interface LogInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *pwd;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginClick:(id)sender {
    
    NSString *username = self.userName.text;
    NSString *pwd = self.pwd.text;
    if ([username isEqualToString:@""] || [pwd isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"用户名或密码不能为空"];
    }
    NSString *sqlUserPwd = [NSString stringWithFormat:@"WHERE %@='%@'",@"name",@"ch"];
    //NSArray *a = [UserInfo findAll];
    UserInfo *user = [UserInfo findFirstWithFormat:sqlUserPwd];

    if ([user.pwd isEqualToString:pwd]) {
        
        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        NSUserDefaults *userDe = [[NSUserDefaults alloc]init];
        [userDe setObject:user.name forKey:@"id"];
        [userDe setBool:YES forKey:@"isLogin"];
        [userDe synchronize];
        [self dismissViewControllerAnimated:YES completion:^{
            
            // 这是从一个模态出来的页面跳到tabbar的某一个页面
            
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            
           
             StudyAbroadViewTabBarController *tabViewController = (StudyAbroadViewTabBarController *) appDelegate.window.rootViewController;
            
            [tabViewController setSelectedIndex:0];
            
        }];

    } else {
        [SVProgressHUD showErrorWithStatus:@"密码错误"];
    }
    
//    CHDBTool *chDB = [CHDBTool shareInstance];
//    //NSMutableArray *users = [NSMutableArray array];
//    [chDB.dbQueue inDatabase:^(FMDatabase *db) {
//        //NSString *tableName = NSStringFromClass(self.class);
//        NSString *sql = [NSString stringWithFormat:@"SELECT * FROM UserInfo WHERE name='ch'"];
//        FMResultSet *resultSet = [db executeQuery:sql];
//        while ([resultSet next]) {
//            
//            NSLog(@"%@",[resultSet objectForColumnName:@"name"]);
//            
//        }
//    }];
    
   
    
    
}
- (IBAction)backView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
