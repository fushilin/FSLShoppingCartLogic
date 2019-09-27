//
//  UIView+FSLView.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/24.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FSLView)

@property( nonatomic , assign) CGFloat fsl_width;

@property( nonatomic , assign) CGFloat fsl_height;

@property( nonatomic , assign) CGFloat fsl_x;

@property( nonatomic , assign) CGFloat fsl_y;

@property( nonatomic , assign) CGFloat fsl_centerX;

@property( nonatomic , assign) CGFloat fsl_centerY;


@property( nonatomic , assign) CGFloat fsl_right;

@property( nonatomic , assign) CGFloat fsl_bottom;


@end

NS_ASSUME_NONNULL_END
