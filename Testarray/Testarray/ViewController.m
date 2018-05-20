//
//  ViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/17.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "ViewController.h"
//#import "RegisterTableViewController.h"
#import "RegisterViewController.h"
#import "LogInViewController.h"

@interface ViewController ()
@property (nonatomic,copy) NSMutableArray *muaa;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1,@2,nil];
    _muaa = array;
    
    [self.muaa removeObjectAtIndex:0];
    
    NSLog(@"%@",array);
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    
    LogInViewController *vc = [[LogInViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (IBAction)registerClick:(UIButton *)sender {
    
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"RegisterViewController" bundle:nil];
    
    RegisterViewController *vc = [story instantiateViewControllerWithIdentifier:@"Register"];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
}
- (IBAction)logInClick:(UIButton *)sender {
}

@end
