//
//  RegisterListTableViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/19.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "RegisterListTableViewController.h"
#import "RegisterViewController.h"
@interface RegisterListTableViewController () <UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property (nonatomic, copy, readwrite) NSArray *countryArray;
@property (nonatomic, copy, readwrite) NSArray *schoolArray;
@property (nonatomic, copy, readwrite) NSArray *yearArray;
@property (nonatomic, copy, readwrite) NSArray *monthArray;

@end

@implementation RegisterListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]init];
    
    view.frame = CGRectZero;
    
    self.tableView.tableFooterView = view;
    
    NSArray *country = @[@"美国",@"日本",@"韩国",@"澳大利亚",@"朝鲜",@"英国"];
    self.yearArray = @[@"2006",@"2007",@"2008",@"2009",@"2010",@"2011",@"2012",@"2013",@"2014",@"2015",@"2016",@"2017",@"2018"];
    self.monthArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    self.schoolArray = @[@"清华大学",@"北京大学",@"天津大学",@"南开大学",@"中山大学",@"山东大学",@"复旦大学",@"厦门大学",@"新疆大学",@"吉林大学"];
    self.countryArray = country;
    self.countryTextField.delegate = self;
    self.countryTextField.dataSource = self;
    self.schoolTextField.delegate = self;
    self.schoolTextField.dataSource = self;
    self.yearTextField.dataSource = self;
    self.yearTextField.delegate = self;
    self.nameTextField.delegate = self;
    self.pwdTextField.delegate = self;
    self.tpwdTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.numberTextField.delegate = self;
    self.countyr = [self.countryArray objectAtIndex:0];
    self.school = [self.schoolArray objectAtIndex:0];
    NSString *dateStr=[self.yearArray objectAtIndex:0];
    
    //NSInteger monRow = [self.yearTextField selectedRowInComponent:1];
    
    NSString *monStr =[self.monthArray objectAtIndex:0];
    
    self.birthday = [NSString stringWithFormat:@"%@%@",dateStr,monStr];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //tapGestureRecognizer.cancelsTouchesInView = NO;
    
    //将触摸事件添加到当前view
    [self.tableView addGestureRecognizer:tapGestureRecognizer];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 8;
}

#pragma mark - PickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (pickerView == self.yearTextField) {
        return 2;
    } else {
        
        return 1;
        
    }
    
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.schoolTextField) {
        return self.schoolArray.count;
    } else if(pickerView == self.countryTextField) {
        
        return self.countryArray.count;
        
    } else {
        NSInteger result = 0;
        switch (component) {
            case 0:
                result = self.yearArray.count;//根据数组的元素个数返回几行数据
                break;
            case 1:
                result = self.monthArray.count;
                break;
                
            default:
                break;
        }
        
        return result;
        
       
    }
    
   
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.schoolTextField) {
        return self.schoolArray[row];
    } else if(pickerView == self.countryTextField) {
        
        return self.countryArray[row];
        
    } else {
        NSString *result = @"";
        switch (component) {
            case 0:
                result = self.yearArray[row];//根据数组的元素个数返回几行数据
                break;
            case 1:
                result = self.monthArray[row];
                break;
                
            default:
                break;
        }
        
        return result;
        
        
    }


}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == self.countryTextField) {
        self.countyr = [self.countryArray objectAtIndex:row];
    } else if (pickerView == self.schoolTextField) {
        self.school = [self.schoolArray objectAtIndex:row];
    } else {
        NSInteger yearrow=[self.yearTextField selectedRowInComponent:0];
        
        NSString *dateStr=[self.yearArray objectAtIndex:yearrow];
        
        NSInteger monRow = [self.yearTextField selectedRowInComponent:1];
        
        NSString *monStr =[self.monthArray objectAtIndex:monRow];
        
        self.birthday = [NSString stringWithFormat:@"%@%@",dateStr,monStr];
    }
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    if (textField == self.nameTextField) {
//        self.name = self.nameTextField.text;
//    } else if(textField == self.pwdTextField) {
//        self.pwd = self.pwdTextField.text;
//    } else if(textField == self.emailTextField) {
//        self.email = self.emailTextField.text;
//    } else {
//        self.number = self.numberTextField.text;
//        NSLog(@"%@", self.numberTextField.text);
//    }
    
//    if (![self.pwdTextField.text isEqualToString:self.tpwdTextField.text]) {
//        NSLog(@"000000");
//    }
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//
//}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.nameTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
    [self.tpwdTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.numberTextField resignFirstResponder];
    [self.tableView endEditing:YES];
    
}
@end
