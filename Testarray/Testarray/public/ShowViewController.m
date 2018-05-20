//
//  ShowViewController.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/20.
//  Copyright © 2018年 陈欢. All rights reserved.
//
#define MaxPicsNum 9
#import "ShowViewController.h"
#import "TZImagePickerController.h"
@interface ShowViewController () <UICollectionViewDelegate,UICollectionViewDataSource,TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *sendMessage;
@property (weak, nonatomic) IBOutlet UICollectionView *imageShow;
@property (nonatomic, strong) NSMutableArray *picsArray;
@end

@implementation ShowViewController

- (NSMutableArray *) picsArray
{
    if (!_picsArray) {
        _picsArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _picsArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(60, 60);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    UICollectionView *collVc = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    
    
    
    self.imageShow = collVc;
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
- (void)goTZImagePickerController
{
    
    TZImagePickerController*pickerVC = [[TZImagePickerController alloc]initWithMaxImagesCount:(MaxPicsNum-self.picsArray.count) delegate:self];
    pickerVC.allowPickingVideo = NO;
    pickerVC.allowPickingOriginalPhoto = NO;//待商榷;
    [self presentViewController:pickerVC animated:YES completion:nil];
    
}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto;
{
    
    [self.picsArray addObjectsFromArray:photos];
    
    [self.imageShow reloadData];
    
}
@end
