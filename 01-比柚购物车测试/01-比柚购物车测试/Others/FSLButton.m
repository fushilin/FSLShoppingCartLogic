//
//  FSLButton.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "FSLButton.h"

@implementation FSLButton

+(UIButton *)createBtnWithTitle:(NSString *)title titleFont:(CGFloat )font titleColor:(UIColor *)titleColor imageName:(NSString *)imageName {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    /// 修改内部尺寸信息
    
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    
    [btn  setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    
//    btn调整内部属性
    
    
    return btn;
}


- (void)layoutSubviews {
      [super layoutSubviews];
      //设置图片的尺寸
      self.imageView.fsl_x = 0;
      self.imageView.fsl_y = 0;
      self.imageView.fsl_width = self.fsl_width;
      self.imageView.fsl_height = self.imageView.fsl_width;
      //设置label的尺寸
       self.titleLabel.fsl_x = 0;
      self.titleLabel.fsl_y = self.imageView.fsl_height;
       self.titleLabel.fsl_width = self.fsl_width;
       self.titleLabel.fsl_height = self.fsl_height - self.imageView.fsl_height;
   }
@end
