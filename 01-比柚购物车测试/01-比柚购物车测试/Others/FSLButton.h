//
//  FSLButton.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSLButton : UIButton

+(UIButton *)createBtnWithTitle:(NSString *)title titleFont:(CGFloat )font titleColor:(UIColor *)titleColor imageName:(NSString *)imageName ;

@end

NS_ASSUME_NONNULL_END
