//
//  GoodsDeleteView.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/27.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "GoodsDeleteView.h"

@interface GoodsDeleteView ()

/// 添加控件方法
/***/
@property(nonatomic,weak) UILabel *selectDeleteLabel  ;

/**deleteBtn 删除按钮*/
@property(nonatomic,weak) UIButton  *selectDeleteBtn ;




@end

/// 选择删除的view 属性控件
@implementation GoodsDeleteView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self createUI] ;
        [self creatLayouts];
        
    }
    return  self;
}

-(void)setMangerDeleteSelectOrNot:(BOOL)mangerDeleteSelectOrNot {
    _mangerDeleteSelectOrNot = mangerDeleteSelectOrNot ;
    
    UIImage *selectImage = self.mangerDeleteSelectOrNot == false ? [UIImage imageNamed:@"ic_g_g"]: [UIImage imageNamed:@"hfht"] ;
    [self.mangerDeleteBtn setImage:selectImage forState:UIControlStateNormal];
    
}

-(void)createUI {
    /// 添加控件
    UIButton *btn = [FSLButton createBtnWithTitle:@"" titleFont:10 titleColor:[UIColor blackColor] imageName:@"ic_g_g"];
    [btn addTarget:self action:@selector(preddDeleteSelectAllBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    self.mangerDeleteBtn= btn ;
    
    /// 添加全选的问题信息
    UILabel *selectLabel = [FSLLabel labelWithText:@"全选" textFont:14 andTextColor:[UIColor blackColor] andTextAligment:NSTextAlignmentLeft backGroundColor:[UIColor whiteColor]];;
    [self addSubview:selectLabel];
    self.selectDeleteLabel = selectLabel ;
    
    ///3: 删除按钮信息
    UIButton *deleteBtn = [FSLButton createBtnWithTitle:@"删除" titleFont:15 titleColor:[UIColor whiteColor] imageName:@""];
    
    [deleteBtn addTarget:self action:@selector(pressDeleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.backgroundColor = [UIColor redColor];
    [self addSubview:deleteBtn ];
    self.selectDeleteBtn = deleteBtn ;
}

/// 按钮的点击事件
-(void)preddDeleteSelectAllBtn {
    self.mangerDeleteSelectOrNot = !self.mangerDeleteSelectOrNot ;
    
    UIImage *selectImage = self.mangerDeleteSelectOrNot == false ? [UIImage imageNamed:@"ic_g_g"]: [UIImage imageNamed:@"hfht"] ;
    
    [self.mangerDeleteBtn setImage:selectImage forState:UIControlStateNormal];
    
    /// 使用Block 控制状态改变
    
    _shoppingCartAllSelectClikeBlock(self.mangerDeleteSelectOrNot);
}

/**
 点击删除按钮
 */
-(void)pressDeleteBtnClick {
    
    _shoppingCartDeleBtnBlock();
    
}

-(void)creatLayouts {
    
    [self.mangerDeleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.width.height.mas_equalTo(30);
    }];
    
    [self.selectDeleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(self.mas_height);
    }];
    
}


@end
