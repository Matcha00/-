//
//  CHCommentModel.h
//  Testarray
//
//  Created by 陈欢 on 2018/5/24.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHDBModel.h"

@interface CHCommentModel : CHDBModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mesageText;
@end
