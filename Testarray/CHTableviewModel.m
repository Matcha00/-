//
//  CHTableviewModel.m
//  Testarray
//
//  Created by feirui on 2018/5/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHTableviewModel.h"
#import <UIKit/UIKit.h>
@implementation CHTableviewModel



- (NSInteger)cellHeight {
    
    if (!_cellHeight) {
        
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT);
        CGFloat textH = [self.messageHouse boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
         NSArray  *imageArray = [[self.imageData componentsSeparatedByString:@","] mutableCopy];
        
        if (imageArray.count > 3) {
            _cellHeight = textH + 200;
        } else {
            _cellHeight = textH + 100;
        }
        
        
    }
    
    return _cellHeight;
}

@end
