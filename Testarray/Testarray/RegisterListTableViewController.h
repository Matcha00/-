//
//  RegisterListTableViewController.h
//  Testarray
//
//  Created by 陈欢 on 2018/5/19.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterListTableViewController : UITableViewController
@property (nonatomic, copy) NSString *test;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pwd;
@property (nonatomic, copy) NSString *countyr;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *school;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *tpwdTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *countryTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *yearTextField;
//@property (weak, nonatomic) IBOutlet UIPickerView *monthTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *schoolTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@end
