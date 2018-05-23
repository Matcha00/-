//
//  AllshowCollectionViewCell.m
//  Testarray
//
//  Created by feirui on 2018/5/23.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "AllshowCollectionViewCell.h"
@interface AllshowCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation AllshowCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setImageData:(NSString *)imageData
{
    _imageData = imageData;
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:imageData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    self.imageView.image = [UIImage imageWithData:data];
}

@end
