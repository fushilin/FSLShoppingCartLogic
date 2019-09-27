//
//  FSLLabel.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UILabel *nameLabel = [[UILabel alloc]init];
 nameLabel.text = @"商品信息";
 nameLabel.textColor = [UIColor blackColor];
 nameLabel.textAlignment = NSTextAlignmentCenter;
 nameLabel.backgroundColor = [UIColor whiteColor];
 nameLabel.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:14];
 */

NS_ASSUME_NONNULL_BEGIN

@interface FSLLabel : UILabel
+(UILabel *)labelWithText:(NSString *)text textFont:(CGFloat)textFont andTextColor:(UIColor *)textColor andTextAligment:(NSTextAlignment)textAligment backGroundColor:(UIColor *)backColor;

@end

NS_ASSUME_NONNULL_END
