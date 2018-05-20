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

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *kkkkkk;
@property (nonatomic, strong) RegisterListTableViewController *vc;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerClick:(id)sender {
    
    self.vc = self.childViewControllers[0];
    
    

    if ([self.vc.nameTextField.text isEqualToString:@""] || [self.vc.pwdTextField.text isEqualToString:@""] || [self.vc.tpwdTextField.text isEqualToString:@""] || [self.vc.emailTextField.text isEqualToString:@""] || [self.vc.numberTextField.text isEqualToString:@""]) {
        return;
    }
    
    if (![self.vc.pwdTextField.text isEqualToString:self.vc.tpwdTextField.text]) {
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
    
    
    
    //NSLog(@"%@，%@，%@，%@，%@，%@",self.vc.countyr,self.vc.name,self.vc.pwd,self.vc.email,self.vc.school,self.vc.birthday);
    
    NSLog(@"%@%@%@%@",self.vc.nameTextField.text,self.vc.countyr,self.vc.birthday,self.vc.school);
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



@end
