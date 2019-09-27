//
//  FSLGoodsCellFooterView.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/24.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "FSLGoodsCellFooterView.h"
#import "FSLImageTitleBtn.h"

@interface FSLGoodsCellFooterView ()

/// 声明各种空间位置
/**促销显示 */
@property(nonatomic,weak)  UIImageView *promotionImageView;

/**促销label信息*/
@property(nonatomic,weak)   UILabel  *promotionLabel ;

/**促销修改*/
@property(nonatomic,weak) FSLImageTitleBtn *promotionBtn ;



@end


@implementation FSLGoodsCellFooterView


///弹窗结束，修改对应的参数？？

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubviews];
        [self createLayouts];
    }
    return  self;
}

-(void)createSubviews {
    UIImageView *imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"coupon_unuse"]];
    [self addSubview:imageView];
    self.promotionImageView = imageView ;
    
    UILabel *promotLabel = [FSLLabel labelWithText:@"满39减5" textFont:14 andTextColor:[UIColor blackColor] andTextAligment:NSTextAlignmentLeft backGroundColor:[UIColor whiteColor]] ;
    [self addSubview:promotLabel];
    self.promotionLabel = promotLabel;
    
    
    /// 修改属性的btn信息
    FSLImageTitleBtn *promotBtn = [FSLImageTitleBtn buttonWithType:UIButtonTypeCustom];
    [promotBtn setImage:[UIImage imageNamed:@"arrows_down_g"] forState:UIControlStateNormal];
    [promotBtn setTitle:@"修改" forState:UIControlStateNormal];
    [promotBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    promotBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [self addSubview:promotBtn];
    self.promotionBtn = promotBtn;
    
    
}
-(void)createLayouts {
    [self.promotionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.left.equalTo(self.mas_left).offset(48);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(26);
    }];
    
    [self.promotionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.left.equalTo(self.promotionImageView.mas_right).mas_offset(5);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(80);
    }];
    
    [self.promotionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).mas_equalTo(-30);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.equalTo (@80);
        
    }];
    
}
@end
