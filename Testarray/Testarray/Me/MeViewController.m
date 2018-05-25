//
//  MeViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/20.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "MeViewController.h"
#import "TZImagePickerController.h"
#import "ViewController.h"
#import "AppDelegate.h"
@interface MeViewController () <TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *headerImage;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)headerImage:(id)sender {
    [self goTZImagePickerController];
}
- (IBAction)likeClic:(id)sender {
}
- (IBAction)personMessageClick:(id)sender {
}
- (IBAction)logoutClick:(id)sender {
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否退出登录" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *logout = [UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSUserDefaults *userDe = [[NSUserDefaults alloc]init];
        [userDe removeObjectForKey:@"id"];
        [userDe setBool:NO forKey:@"isLogin"];
        [userDe synchronize];
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main1" bundle:nil];
        
        ViewController *vc = [story instantiateViewControllerWithIdentifier:@"hhhh"];
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        
        
        appDelegate.window.rootViewController = vc ;
        
    }];
    
    UIAlertAction *qx = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:logout];
    [alert addAction:qx];
    [self presentViewController:alert animated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)goTZImagePickerController
{
    
    TZImagePickerController*pickerVC = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
    pickerVC.allowPickingVideo = NO;
    pickerVC.allowPickingOriginalPhoto = NO;//待商榷;
    [self presentViewController:pickerVC animated:YES completion:nil];
    
}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto;
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.headerImage setImage:photos[0] forState:UIControlStateNormal];
        
    });
    
    
    
}
@end
