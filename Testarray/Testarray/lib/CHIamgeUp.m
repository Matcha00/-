//
//  CHIamgeUp.m
//  Testarray
//
//  Created by 陈欢 on 2018/6/1.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHIamgeUp.h"

@implementation CHIamgeUp

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
     self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect imageFrame = self.imageView.frame;
    
    imageFrame.origin.x = 0;
    imageFrame.origin.y  = 0;
    imageFrame.size.width = self.frame.size.width;
    imageFrame.size.height = self.frame.size.height - self.titleLabel.frame.size.height;
    
    self.imageView.frame = imageFrame;
    
    CGRect titleLabelFrame = self.titleLabel.frame;
    titleLabelFrame.origin.x = 0;
    titleLabelFrame.origin.y = self.imageView.frame.size.height;
    titleLabelFrame.size.width = self.frame.size.width;
    titleLabelFrame.size.height = self.frame.size.height - titleLabelFrame.origin.y;
    
    self.titleLabel.frame = titleLabelFrame;
}
@end
