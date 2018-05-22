//
//  AllShowTableViewCell.m
//  Testarray
//
//  Created by feirui on 2018/5/22.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "AllShowTableViewCell.h"
#import "HouseModel.h"
@interface AllShowTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *zhengwen;

@end
@implementation AllShowTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHouse:(HouseModel *)house
{
    _house = house;
    
    self.zhengwen.text = house.messageHouse;
}

@end
