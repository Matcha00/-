//
//  RegisterViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/17.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "RegisterViewController.h"
#import "UserInfo.h"
#import "RegisterListTableViewController.h"
#import "SVProgressHUD.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *kkkkkk;
@property (nonatomic, strong) RegisterListTableViewController *vc;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    tapGestureRecognizer.numberOfTapsRequired = 1;
    
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerClick:(id)sender {
    
    self.vc = self.childViewControllers[0];
    
    

    if ([self.vc.nameTextField.text isEqualToString:@""] || [self.vc.pwdTextField.text isEqualToString:@""] || [self.vc.tpwdTextField.text isEqualToString:@""] || [self.vc.emailTextField.text isEqualToString:@""] || [self.vc.numberTextField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请填写所有详细信息"];
        return;
    }
    
    if (![self.vc.pwdTextField.text isEqualToString:self.vc.tpwdTextField.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次密码不一致"];
        return;
    }
    
    UserInfo *user = [[UserInfo alloc]init];
    
    user.name = self.vc.nameTextField.text;
    user.pwd = self.vc.pwdTextField.text;
    user.email = self.vc.emailTextField.text;
    user.number = self.vc.numberTextField.text;
    user.school = self.vc.school;
    user.birthday = self.vc.birthday;
    user.countyr = self.vc.countyr;
    
    [user save];
    [SVProgressHUD showSuccessWithStatus:@"注册成功"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //NSLog(@"%@，%@，%@，%@，%@，%@",self.vc.countyr,self.vc.name,self.vc.pwd,self.vc.email,self.vc.school,self.vc.birthday);
    
    //NSLog(@"%@%@%@%@",self.vc.nameTextField.text,self.vc.countyr,self.vc.birthday,self.vc.school);
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"test"]) {
        self.vc = segue.destinationViewController;
        //NSLog(@"%@",vc.test);
    }
}
- (IBAction)dissBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.vc.nameTextField resignFirstResponder];
    [self.vc.pwdTextField resignFirstResponder];
    [self.vc.tpwdTextField resignFirstResponder];
    [self.vc.emailTextField resignFirstResponder];
    [self.vc.numberTextField resignFirstResponder];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.vc.nameTextField resignFirstResponder];
    [self.vc.pwdTextField resignFirstResponder];
    [self.vc.tpwdTextField resignFirstResponder];
    [self.vc.emailTextField resignFirstResponder];
    [self.vc.numberTextField resignFirstResponder];
    [self.vc.view endEditing:YES];
}

@end
