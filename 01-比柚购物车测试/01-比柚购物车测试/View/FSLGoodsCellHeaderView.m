//
//  FSLGoodsCellHeaderView.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/24.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "FSLGoodsCellHeaderView.h"

@interface FSLGoodsCellHeaderView ()

/**headerImagee*/
@property(nonatomic,weak) UIImageView *headerImage  ;

/**标间信息*/
@property(nonatomic,weak) UILabel  *showTitleLabel ;

/**去凑单的btnView*/
@property(nonatomic,weak) UIView *selectView ;


/**去凑单的label信息*/
@property(nonatomic,weak) UILabel *headerCollectLabel ;

/**headerimage*/
@property(nonatomic,weak) UIImageView *headerShowImage ;




@end


@implementation FSLGoodsCellHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        /// 1: 加载控件
        [self creatSubviews];
        
        
        [self createLayouts];
    }
    return  self;
}

-(void)creatSubviews {
    
    /// 店铺图标
    UIImageView *headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_weixin_share"]];
    [self addSubview:headerImageView];
    self.headerImage = headerImageView;
    
    /// 满减文字
    UILabel *showTitileLabel = [FSLLabel labelWithText:@"满一百减十" textFont:14 andTextColor:[UIColor blackColor] andTextAligment:NSTextAlignmentLeft backGroundColor:[UIColor whiteColor]];
    [self addSubview:showTitileLabel];
    self.showTitleLabel = showTitileLabel;
    
    
    UIView *selectView = [[UIView alloc] init];
    [self addSubview:selectView];
    self.selectView = selectView;
    
    UILabel *headerCollectLabel = [FSLLabel labelWithText:@"去凑单" textFont:12 andTextColor:[UIColor blackColor] andTextAligment:NSTextAlignmentRight backGroundColor:[UIColor whiteColor]];
    [selectView addSubview:headerCollectLabel];
    self.headerCollectLabel = headerCollectLabel ;
    
    UIImageView *headerSelectImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_arrow_g"]];
    [selectView addSubview:headerSelectImageView];
    self.headerShowImage = headerSelectImageView;
    
}

-(void)createLayouts {
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_equalTo(50);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
        
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
        
    }];
    
    [self.showTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImage.mas_right).mas_equalTo(10);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
        
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(100);
        
        
    }];
    
    
    [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).mas_equalTo(-20);
        make.centerY.equalTo(self.mas_centerY).mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(105);
        
    }];
    

    
    [self.headerShowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
         make.centerY.equalTo(self.selectView.mas_centerY).mas_equalTo(0);
        
        make.right.equalTo(self.selectView.mas_right).mas_equalTo(-5);
        make.width.mas_equalTo(10);
        make.height.equalTo(@10);
        
    }];
    
    [self.headerCollectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectView.mas_left).mas_equalTo(0);
        make.centerY.equalTo(self.selectView.mas_centerY).mas_equalTo(0);
        make.height.equalTo(self.selectView.mas_height);
        make.right.equalTo(self.headerShowImage.mas_left).mas_equalTo(0);
        
    }];
    
}


@end
