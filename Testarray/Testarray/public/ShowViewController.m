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
#import "ShowCollectionViewCell.h"
#import "CHTextView.h"
#import "HouseModel.h"
#import "CHStudyModel.h"
#import "CHResModel.h"
#import "CHInternshipModel.h"
#import "CHPartTimeJobModel.h"
@interface ShowViewController () <UICollectionViewDelegate,UICollectionViewDataSource,TZImagePickerControllerDelegate>
//@property (weak, nonatomic) IBOutlet UITextView *sendMessage;
@property (weak, nonatomic) IBOutlet CHTextView *sendMessage;
@property (weak, nonatomic) IBOutlet UICollectionView *imageShow;
@property (nonatomic, strong) NSMutableArray *picsArray;
@property (nonatomic, strong) UIButton *sendButton;
@end

@implementation ShowViewController

- (NSMutableArray *) picsArray
{
    if (!_picsArray) {
        _picsArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _picsArray;
}

- (UIButton *)sendButton
{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.backgroundColor = [UIColor orangeColor];
        [_sendButton setTitle:@"发布" forState:UIControlStateNormal];
        [_sendButton setTintColor:[UIColor whiteColor]];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sendButton addTarget:self action:@selector(sendClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.itemSize = CGSizeMake(60, 60);
//    layout.minimumLineSpacing = 5;
//    layout.minimumInteritemSpacing = 5;
//    UICollectionView *collVc = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
//    [collVc registerNib:[UINib nibWithNibName:@"ShowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"show"];
//    collVc.delegate = self;
//    collVc.dataSource = self;
    
    //self.imageShow = collVc;
    // Do any additional setup after loading the view from its nib.
    
    self.sendMessage.placeholder = @"请输入内容";
    self.sendMessage.placeholderColor = [UIColor redColor];
    self.imageShow.delegate = self;
    self.imageShow.dataSource = self;
    [self.imageShow registerNib:[UINib nibWithNibName:@"ShowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"show"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.sendButton];
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
#pragma mark collection method

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.picsArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"show" forIndexPath:indexPath];
    if (indexPath.row == self.picsArray.count) {
        //[self goTZImagePickerController];
    } else {
        cell.image = self.picsArray[indexPath.row];
    }
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.picsArray.count) {
        [self goTZImagePickerController];
    } else {
        [self.picsArray removeObjectAtIndex:indexPath.row];
        [self.imageShow deleteItemsAtIndexPaths:@[indexPath]];
    }
}




#pragma mark private method
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

- (void)sendClick
{
    NSUserDefaults *user = [[NSUserDefaults alloc]init];
    
    NSString *getUsername = [user objectForKey:@"id"];
    NSMutableArray *picturesStr = [NSMutableArray array];
    NSString *text =  self.sendMessage.text;
    for (UIImage *image in self.picsArray) {
        //上传图片压缩比例
        NSData *data = UIImageJPEGRepresentation(image, 0.6f);
        NSString *encodedImageStr = [NSString stringWithFormat:@"%@",[data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]];
        [picturesStr addObject:encodedImageStr];
    }
    
    NSString *pictStr = [picturesStr componentsJoinedByString:@","];
    switch (self.type) {
        case CHTypeAllHouse:
        {
            HouseModel *house = [[HouseModel alloc]init];
            house.messageHouse = text;
            house.imageData = pictStr;
            house.userName = getUsername;
            [house save];
        }
            break;
        case CHTypeAllSX:
        {
            CHInternshipModel *sxModel = [[CHInternshipModel alloc]init];
            sxModel.messageHouse = text;
            sxModel.imageData = pictStr;
            sxModel.userName = getUsername;
            [sxModel save];
        }
           
            break;
        case CHTypeAllJZ:
        {
            CHPartTimeJobModel *jzModel = [[CHPartTimeJobModel alloc]init];
            jzModel.messageHouse = text;
            jzModel.imageData = pictStr;
            jzModel.userName = getUsername;
            [jzModel save];
        }
            break;
        case CHTypeAllStudy:
        {
            CHStudyModel *studyModel = [[CHStudyModel alloc]init];
            studyModel.messageHouse = text;
            studyModel.imageData = pictStr;
            studyModel.userName = getUsername;
            [studyModel save];
        }
            break;
        case CHTypeAllWPShop:
        {
            CHResModel *resModel = [[CHResModel alloc]init];
            resModel.messageHouse = text;
            resModel.imageData = pictStr;
            resModel.userName = getUsername;
            [resModel save];
            
        }
            break;
            
        default:
            break;
    }
//    HouseModel *house = [[HouseModel alloc]init];
//
//
//
//    house.messageHouse = text;
//    house.imageData = pictStr;
//    house.userName = getUsername;
//    [house save];
    //NSMutableArray *arr = [[pictStr componentsSeparatedByString:@","] mutableCopy];  //解析
    //NSLog(@"%ld", arr.count);
}
@end
