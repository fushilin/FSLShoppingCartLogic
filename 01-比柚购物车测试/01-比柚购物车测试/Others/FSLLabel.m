

//
//  FSLLabel.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "FSLLabel.h"

@implementation FSLLabel


+(UILabel *)labelWithText:(NSString *)text textFont:(CGFloat)textFont andTextColor:(UIColor *)textColor andTextAligment:(NSTextAlignment)textAligment backGroundColor:(UIColor *)backColor {
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = text;
    nameLabel.font = [UIFont systemFontOfSize:textFont];
    nameLabel.textColor = textColor;
    nameLabel.textAlignment = textAligment;
    nameLabel.backgroundColor = backColor;
   
    return nameLabel;
}

@end
