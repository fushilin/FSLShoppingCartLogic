//
//  GoodsCloseView.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/25.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "GoodsCloseView.h"


/// 属性需要暴露给外界调用

@interface GoodsCloseView ()
/**结算按钮*/
@property(nonatomic,weak) UIButton  *selectAllBtn ;

///**总计人民币Label*/
//@property(nonatomic,weak) UILabel *totalLabel ;

/**活动优惠价格*/
@property(nonatomic,weak) UILabel *discountesLabel ;

/**结算按钮*/
@property(nonatomic,weak) UIButton  *decreaseBtn ;



@end


@implementation GoodsCloseView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame] ) {
        
        self.backgroundColor = [UIColor grayColor];
        [self createSubviews];
        
        [self createLayouts];
    }
    return  self;
    
}

-(void) createSubviews {
    UIButton  *selectBtn = [FSLButton createBtnWithTitle:@"" titleFont:14 titleColor:[UIColor whiteColor] imageName:@"ic_g_g"];
    [selectBtn addTarget:self action:@selector(pressSelectAllGoods) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:selectBtn];
    self.selectAllBtn = selectBtn;
    
    
    /// 添加priceLabel
    UILabel *totalPriceLabel = [[UILabel alloc]init];
    totalPriceLabel.textAlignment = NSTextAlignmentCenter ;
    totalPriceLabel.font =  [ UIFont systemFontOfSize:14];
 
    /// 变段信息处理
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"猴年大吉,新春快乐!"];
 
    [AttributedStr addAttribute:NSFontAttributeName  value:[UIFont systemFontOfSize:14.0]   range:NSMakeRange(2, 2)];
 
    [AttributedStr addAttribute:NSForegroundColorAttributeName   value:[UIColor redColor]  range:NSMakeRange(2, 2)];

    totalPriceLabel.attributedText = AttributedStr;
    [self addSubview:totalPriceLabel];
    self.shoppingPriceLabel = totalPriceLabel ;
}


/// 设置改变的信息
-(void)setPriceTextString:(NSString *)priceTextString {
    _priceTextString = priceTextString ;
    
    NSString *reminderString = @"总计人民币";
    NSString *attreString = [NSString stringWithFormat:@"%@%@",reminderString,priceTextString];
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:attreString];
    
    [AttributedStr addAttribute:NSFontAttributeName  value:[UIFont systemFontOfSize:14.0]   range:NSMakeRange(0, reminderString.length)];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName  value:[UIColor redColor]  range:NSMakeRange(reminderString.length, priceTextString.length)];
    
     self.shoppingPriceLabel.attributedText = AttributedStr;
}



-(void)pressSelectAllGoods {
   
    self.shoppAllSelectBool = !self.shoppAllSelectBool ;
    
    UIImage *selectImage = self.shoppAllSelectBool == false ? [UIImage imageNamed:@"ic_g_g"]: [UIImage imageNamed:@"hfht"] ;
    
    [self.selectAllBtn setImage:selectImage forState:UIControlStateNormal];
    _shoppingCartSelectBtnBlock(self.shoppAllSelectBool);
    
}

/**
 修改按钮的展示状态
 */
-(void)setShoppAllSelectBool:(BOOL)shoppAllSelectBool {
    //赋值
    _shoppAllSelectBool = shoppAllSelectBool;
    
    UIImage *selectImage = self.shoppAllSelectBool == false ? [UIImage imageNamed:@"ic_g_g"]: [UIImage imageNamed:@"hfht"] ;
    [self.selectAllBtn setImage:selectImage forState:UIControlStateNormal];

}

/**
 布局位置信息
 */
-(void)createLayouts {
    [self.selectAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.width.height.equalTo(@40);
        
    }];
    
    [self.shoppingPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectAllBtn.mas_right).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.height.equalTo(@40);
        
    }];
    
}

@end
