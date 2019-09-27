//
//  FSLGoodsChangeCountView.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/25.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "FSLGoodsChangeCountView.h"

/// 添加对应的 信息
@interface FSLGoodsChangeCountView ()<UITextFieldDelegate>

/**
leftFBtn 减少 count
 */

@property(nonatomic,weak) UIButton *leftDeleteCountBtn ;

///middleTextField
/**TextFile count*/
@property(nonatomic,weak) UITextField *countTextField ;

/// rightAddBtn
@property(nonatomic,weak) UIButton *rightAddCountBtn ;




@end

@implementation FSLGoodsChangeCountView

/// 自定义View的信息
-(instancetype)initWithFrame:(CGRect)frame {
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
   
        [self createSubviews];
        
        [self createLayouts ];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notionEndEnding) name:NotionTextFieldEndeing object:nil];
        
    }
    return self;
}
-(void)createSubviews {
    
    ///1: 左侧按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"Coupon_center_last_b"] forState:UIControlStateNormal];
    
//    [leftBtn ]
    [leftBtn setImage:[UIImage imageNamed:@"Coupon_center_last" ] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(leftDeleteCountBtnClike:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    self.leftDeleteCountBtn = leftBtn;
    
    
    /// 2:中间的textField
    UITextField *middleTextField = [[UITextField alloc]init];
    middleTextField.font = [UIFont systemFontOfSize:12];
//    middleTextField.text = [NSString stringWithFormat:@"%ld",self.textCount];
    middleTextField.keyboardType = UIKeyboardTypeNumberPad;
    middleTextField.layer.masksToBounds = true;
    middleTextField.layer.borderWidth = 1 ;
    middleTextField.layer.borderColor = [UIColor grayColor].CGColor;
    middleTextField.delegate = self;
    [self addSubview:middleTextField];
    
    self.countTextField = middleTextField ;
    
    
    ///3:右侧的按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"Coupon_center_last_b"] forState:UIControlStateNormal];
      [rightBtn setBackgroundImage:[UIImage imageNamed:@"Coupon_center_last" ] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(rightAddCountBtnClike:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:rightBtn];
    self.rightAddCountBtn = rightBtn;
    
}

/// 配置信息
-(void)createLayouts {
    [self.leftDeleteCountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_equalTo(0);
        make.left.equalTo(self.mas_left).mas_equalTo(0);
        make.bottom.equalTo(self.mas_bottom).mas_equalTo(0);
        make.width.equalTo(@25);
    }];
    
    /// 右侧数据的改变信息
    [self.rightAddCountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_equalTo(0);
        make.right.equalTo(self.mas_right).mas_equalTo(0);
        make.bottom.equalTo(self.mas_bottom).mas_equalTo(0);
        make.width.equalTo(@25);
        
    }];
    
    
    /// zh中间位置
    [self.countTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).mas_equalTo(0);
        make.left.equalTo(self.leftDeleteCountBtn.mas_right).mas_equalTo(0);
        make.bottom.equalTo(self.mas_bottom).mas_equalTo(0);
        make.right.equalTo(self.rightAddCountBtn.mas_left).mas_equalTo(0);
    }];
}

-(void)setDetailModel:(DetailModel *)detailModel {
    _detailModel = detailModel;
    self.countTextField.text = [NSString stringWithFormat:@"%ld",detailModel.goodsCount];
    
    
}

/// 进行逻辑判断 不能小于0
-(void)leftDeleteCountBtnClike:(UIButton *)btn {
    if (self.detailModel.goodsCount>1) {
        self.detailModel.goodsCount -= 1;
    }else {
        // 提示信息
    }
       _textFieldBlock();
    self.countTextField.text = [NSString stringWithFormat:@"%ld",self.detailModel.goodsCount];
    
}




/// 不能大于最大库存
-(void)rightAddCountBtnClike:(UIButton *)btn {
    /// 做判断
    if (self.detailModel.goodsCount < self.detailModel.warehouseCount) {
         self.detailModel.goodsCount+= 1;
    }else {
        /// 提示信息
    }
   
       _textFieldBlock();
    self.countTextField.text = [NSString stringWithFormat:@"%ld",self.detailModel.goodsCount];
    
}

/// end 操作
-(void)textFieldDidEndEditing:(UITextField *)textField {
    if ( textField.text.length  == 0 ) {
        self.detailModel.goodsCount = 1;
    } else {
        
        /// 不能是 0 开头的数字
        /// 如果内容大于库存，
        
        NSLog(@"text--%d",[[NSString stringWithFormat:@"%@",textField.text] intValue]);
        
        
        
        if ([[NSString stringWithFormat:@"%@",textField.text] intValue] > self.detailModel.warehouseCount) {
            self.detailModel.goodsCount = self.detailModel.warehouseCount;
            
            /// 提示信息
        }else if ([[NSString stringWithFormat:@"%@",textField.text] intValue] <= self.detailModel.warehouseCount && [[NSString stringWithFormat:@"%@",textField.text] intValue] != 0) {
            self.detailModel.goodsCount =  [[NSString stringWithFormat:@"%@",textField.text] intValue] ;
        }else if ( [[NSString stringWithFormat:@"%@",textField.text] intValue] == 0) {
            /// 等于之前值信息
//            self.detailModel.goodsCount = self.detailModel.warehouseCount;
            
        }
    }
    _textFieldBlock();
    self.countTextField.text = [NSString stringWithFormat:@"%ld",self.detailModel.goodsCount];
}

/// 监听滚动的通知



@end
