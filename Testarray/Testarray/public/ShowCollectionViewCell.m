//
//  ShowCollectionViewCell.m
//  Testarray
//
//  Created by feirui on 2018/5/21.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "ShowCollectionViewCell.h"



@interface ShowCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@end


@implementation ShowCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.showImage.image = image;
}
@end
