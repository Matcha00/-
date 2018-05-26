//
//  AllShowPushTableViewCell.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/24.
//  Copyright © 2018年 陈欢. All rights reserved.
//
#import "CHCommentModel.h"
#import "AllShowPushTableViewCell.h"
@interface AllShowPushTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;


@end
@implementation AllShowPushTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(CHCommentModel *)model
{
    _model = model;
    
    self.nameLabel.text = model.name;
    self.messageLabel.text = model.mesageText;
}
@end
