//
//  FSLImageTitleBtn.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/25.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "FSLImageTitleBtn.h"

@implementation FSLImageTitleBtn

-(void)layoutSubviews {
    [super layoutSubviews];
    /// 配置内部的宽高位置
    
    /// 计算宽高配比

//
    CGFloat imageW = self.imageView.frame.size.width;
    CGFloat imageH = self.imageView.frame.size.height;


    CGFloat titleWidth = self.titleLabel.frame.size.width;
    CGFloat titleHeight = self.titleLabel.frame.size.height;


    self.titleLabel.fsl_width = titleWidth;
    self.titleLabel.fsl_height = titleHeight;
    self.titleLabel.fsl_x = 20;
//    self.titleLabel.fsl_centerY = self.fsl_centerY;


     self.imageView.frame = CGRectMake(titleWidth+10, 0 , imageW/2, imageH/2);
//    self.imageView.fsl_centerY = self.fsl_centerY;
}

@end
