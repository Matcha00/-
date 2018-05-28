//
//  AllShowTableViewCell.m
//  Testarray
//
//  Created by feirui on 2018/5/22.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "AllShowTableViewCell.h"
#import "HouseModel.h"
#import "AllshowCollectionViewCell.h"
#import "CHCollectModel.h"
#import "CHTableviewModel.h"
@interface AllShowTableViewCell() <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *imageShow;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (weak, nonatomic) IBOutlet UILabel *zhengwen;
@property (weak, nonatomic) IBOutlet UIButton *scButton;

@end
@implementation AllShowTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageShow.delegate = self;
    self.imageShow.dataSource = self;
    [self.imageShow registerNib:[UINib nibWithNibName:@"AllshowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"showcollcell"];
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHouse:(CHTableviewModel *)house
{
    _house = house;
    
    self.zhengwen.text = house.messageHouse;
    self.imageArray = [[house.imageData componentsSeparatedByString:@","] mutableCopy];
    
}

- (IBAction)sc:(id)sender {
    
    CHCollectModel *colletcModel = [[CHCollectModel alloc]init];
    self.scButton.selected = YES;
    colletcModel.messageHouse = self.house.messageHouse;
    colletcModel.imageData = self.house.imageData;
    [colletcModel save];
    
    
}


#pragma mark privte uicollectionview
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AllshowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"showcollcell" forIndexPath:indexPath];
    cell.imageData = self.imageArray[indexPath.row];
    return cell;
}
+ (instancetype)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
@end
