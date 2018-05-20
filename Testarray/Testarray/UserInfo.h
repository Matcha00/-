//
//  UserInfo.h
//  Testarray
//
//  Created by 陈欢 on 2018/5/19.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHDBModel.h"

@interface UserInfo : CHDBModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pwd;
@property (nonatomic, copy) NSString *countyr;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *school;
@end
