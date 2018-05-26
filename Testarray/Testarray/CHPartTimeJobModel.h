//
//  CHPartTimeJobModel.h
//  Testarray
//
//  Created by feirui on 2018/5/23.
//  Copyright © 2018年 陈欢. All rights reserved.
//  兼职模型

#import "CHDBModel.h"

@interface CHPartTimeJobModel : CHDBModel
@property (nonatomic, copy) NSString *messageHouse;
@property (nonatomic, copy) NSString *imageData;
@property (nonatomic, copy) NSString *userName;
@end
