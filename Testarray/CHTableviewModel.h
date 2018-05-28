//
//  CHTableviewModel.h
//  Testarray
//
//  Created by feirui on 2018/5/28.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHDBModel.h"

@interface CHTableviewModel : CHDBModel
@property (nonatomic, copy) NSString *messageHouse;
@property (nonatomic, copy) NSString *imageData;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, assign) NSInteger cellHeight;
@end
