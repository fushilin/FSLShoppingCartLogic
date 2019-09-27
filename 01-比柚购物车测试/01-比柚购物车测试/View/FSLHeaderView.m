//
//  FSLHeaderView.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "FSLHeaderView.h"
#import "Masonry.h"
#import "FSLButton.h"
#import "FSLLabel.h"

@interface FSLHeaderView ()

/**选择按钮*/
@property(nonatomic,weak) UIButton *selectBtn ;
///店铺图片信息
/**图片*/
@property(nonatomic,weak) UIImageView *storeImage ;


/**信息*/
@property(nonatomic,weak) UILabel *nameLabel ;

/// 右侧的信息处理
/**右侧箭头信息*/
@property(nonatomic,weak) UIImageView *arrowImageView ;

/**数据*/
@property(nonatomic , assign) CGFloat  textWidth ;

@end

/// cell的headerView的信息

@implementation FSLHeaderView

/// 初始化信息
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
      /// 给自身添加点击信息
        self.userInteractionEnabled = true ;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]  initWithTarget:self action:@selector(pressViewGesture)] ];
        
        
        /// 创建基本控件信息
        [self createUISubviews];

        [self addSubviews];

    }
    return  self;
}

/// 添加label信息，获取点击事件
-(void)createUISubviews {
    
    /// 首先创建对应的按钮信息
     UIButton *selectBtn = [FSLButton createBtnWithTitle:@"" titleFont:10 titleColor:[UIColor redColor] imageName:@"ic_g_g" ];
    [selectBtn addTarget:self action:@selector(pressSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:selectBtn];
    self.selectBtn = selectBtn;
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_weixin_share"]];
    [self addSubview:imageView];
    self.storeImage = imageView;
    
    /// 名称信息
    UILabel *nameLabel = [FSLLabel labelWithText:@"商品信息" textFont:14 andTextColor:[UIColor blackColor] andTextAligment:NSTextAlignmentLeft backGroundColor:[UIColor whiteColor]];
    
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UIImageView *arrowImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_arrow_g"]];
    [self addSubview:arrowImageView];
    self.arrowImageView = arrowImageView;
    

}

-(void)setMangerHeaderSelectOrNot:(BOOL)mangerHeaderSelectOrNot {
    _mangerHeaderSelectOrNot = mangerHeaderSelectOrNot ;
}

/// 设置信息 赋值
-(void)setShowModel:(DataShowModel *)showModel {
    _showModel =  showModel;
    self.nameLabel.text = showModel.home;
    
    ///  计算文字宽度
    
     CGSize size = [self sizeWithText:showModel.home font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    if (size.width >=180 ) {
        _textWidth = 180 ;
    }else {
        _textWidth = size.width+40;
    }
    UIImage *image ;
    
    if (self.mangerHeaderSelectOrNot == false) {
        image = [UIImage imageNamed: showModel.allSelectType == false ? @"ic_g_g" : @"hfht"] ;
        
    }
    else if (self.mangerHeaderSelectOrNot == true ){
        image = [UIImage imageNamed: showModel.mangerAllSelectType == false ? @"ic_g_g" : @"hfht"] ;
        
    }
    
    
    [self.selectBtn setImage:image forState:UIControlStateNormal];

    /// 设置图片的信息
}

-(void)addSubviews{
    /// 按钮位置
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.width.equalTo(@40);
    }];
    
    [self.storeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectBtn.mas_right).offset(15);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(23);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.storeImage.mas_right).offset(8);
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
//        make.width.offset(self.textWidth);
    }];
    
    /// 按钮imageView布局
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(10);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@6);
        make.height.equalTo(@10);
        make.right.mas_lessThanOrEqualTo(-10);
    } ];
}
/// 数据处理区
-(void)pressSelectBtn:(UIButton *)selectBtn {
    NSLog(@"model-----%@-----",self.showModel.home);
    
    if (self.mangerHeaderSelectOrNot  == false ) {
        self.showModel.allSelectType = !self.showModel.allSelectType;
        UIImage *image = [UIImage imageNamed: self.showModel.allSelectType == false ? @"ic_g_g" : @"hfht"] ;
        [self.selectBtn setImage:image forState:UIControlStateNormal];
    } else if ( self.mangerHeaderSelectOrNot == true) {
        self.showModel.mangerAllSelectType = !self.showModel.mangerAllSelectType ;
        UIImage *image = [UIImage imageNamed: self.showModel.mangerAllSelectType == false ? @"ic_g_g" : @"hfht"] ;
        [self.selectBtn setImage:image forState:UIControlStateNormal];
    }
 
    _allSeclectBack(self.showModel);
}



///  点击headerView 店铺跳转信息
-(void)pressViewGesture {
    NSLog(@"点击了对应的headerView");
}



-(void)layoutSubviews {
    [super layoutSubviews];

    
    
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
