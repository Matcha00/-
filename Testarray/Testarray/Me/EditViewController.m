//
//  EditViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/26.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "EditViewController.h"
#import "UserInfo.h"
#import "SVProgressHUD.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *sr;
@property (weak, nonatomic) IBOutlet UITextField *gj;
@property (weak, nonatomic) IBOutlet UITextField *xx;
@property (weak, nonatomic) IBOutlet UITextField *xh;
@property (weak, nonatomic) IBOutlet UITextField *yx;
@property (nonatomic, strong) UIButton *sendButton;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"编辑资料";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.sendButton];
    NSUserDefaults *user = [[NSUserDefaults alloc]init];
    
    NSString *getUsername = [user objectForKey:@"id"];
    
    NSString *sqlUserPwd = [NSString stringWithFormat:@"WHERE %@='%@'",@"name",getUsername];
    //NSArray *a = [UserInfo findAll];
    UserInfo *userInfo = [UserInfo findFirstWithFormat:sqlUserPwd];
    self.name.text = userInfo.name;
    self.sr.text = userInfo.birthday;
    self.gj.text = userInfo.countyr;
    self.xx.text = userInfo.school;
    self.xh.text = userInfo.number;
    self.yx.text = userInfo.email;
    // Do any additional setup after loading the view from its nib.
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[[UIApplication sharedApplication]keyWindow] endEditing:YES];
}


- (UIButton *)sendButton
{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.backgroundColor = [UIColor orangeColor];
        [_sendButton setTitle:@"保存" forState:UIControlStateNormal];
        [_sendButton setTintColor:[UIColor whiteColor]];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sendButton addTarget:self action:@selector(sendClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}
- (void)sendClick
{
    UserInfo *userInfo = [[UserInfo alloc]init];
    
    userInfo.name =self.name.text;
   userInfo.birthday = self.sr.text ;
    userInfo.countyr =self.gj.text  ;
    userInfo.school = self.xx.text  ;
    userInfo.number =self.xh.text  ;
    userInfo.email= self.yx.text  ;
    
    [userInfo update];
    
    [SVProgressHUD showSuccessWithStatus:@"保存成功"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
