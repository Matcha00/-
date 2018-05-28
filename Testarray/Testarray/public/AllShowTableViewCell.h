//
//  AllShowTableViewCell.h
//  Testarray
//
//  Created by feirui on 2018/5/22.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHTableviewModel;
@interface AllShowTableViewCell : UITableViewCell
@property (nonatomic, strong) CHTableviewModel *house;
- (void)reloadImage;
+ (instancetype)cell;
@end
