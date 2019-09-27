//
//  FSLGoodsCell.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/24.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "FSLGoodsCell.h"
 #import <CoreGraphics/CoreGraphics.h>
#import "FSLGoodsCellHeaderView.h"
#import "FSLGoodsChangeCountView.h"


/// 添加对应的属性值信息
@interface FSLGoodsCell()


/**selectoBtn*/
@property(nonatomic,weak) UIButton *selectBtn;

/**满减shwo 或者优惠减信息*/
@property(nonatomic,weak) UIImageView *fullDeleteImageView ;

/**去凑单按钮*/
@property(nonatomic,weak) UIButton *togetherBtn ;

/**主图片*/
@property(nonatomic,weak) UIImageView *iconImageView ;

/**名称label信息*/
@property(nonatomic,weak) UILabel *nameLabel ;


/**修改需要购买的标签信息*/
@property(nonatomic,weak) UIButton *changeBuySpec ;

/**剩余数量*/
@property(nonatomic,weak) UILabel *residutCount ;

/**价格属性*/
@property(nonatomic,weak) UILabel *priceLabel ;

/**汇率label信息*/
@property(nonatomic,weak) UILabel *paritiesLabel ;

/**修改的view信息*/
@property(nonatomic,weak) FSLGoodsChangeCountView *amendTextView ;


/**footerView*/
@property(nonatomic,weak) FSLGoodsCellFooterView *cellFooterView ;

/**cellHeaderView*/
@property(nonatomic,weak) FSLGoodsCellHeaderView *cellHeaderView ;



@end

@implementation FSLGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *string = @"string";
    
    FSLGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    
    if (cell == nil) {
        cell =[[FSLGoodsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
 
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
   self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addChildControl];
        
        [self creatUILayout];
        
    }
    return   self;
}
-(void)addChildControl {
    /// 添加头部的View信息
    FSLGoodsCellHeaderView *header =[[FSLGoodsCellHeaderView alloc] init];
    [self.contentView addSubview:header];
    self.cellHeaderView = header;
    
    
    
    /// 先添加控件信息
    UIButton *selectBtn = [FSLButton createBtnWithTitle:@"" titleFont:14 titleColor:[UIColor whiteColor] imageName:@"ic_g_g"];
    [self.contentView addSubview:selectBtn];
    
    /// 添加点击事件
    [selectBtn addTarget:self action:@selector(pressSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.selectBtn = selectBtn;
    
    
    
    /// 3:添加选择图片选择信息
    UIImageView *iconImage =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"join_img1"]];
    [self.contentView addSubview:iconImage];
    self.iconImageView = iconImage ;
    
    UILabel *nameLabel = [FSLLabel labelWithText:@"" textFont:14 andTextColor:[UIColor blackColor] andTextAligment:NSTextAlignmentLeft backGroundColor:[UIColor grayColor]];
    [self.contentView addSubview:nameLabel];
    
    self.nameLabel = nameLabel;
    
    
    FSLGoodsCellFooterView *cellFooterView = [[FSLGoodsCellFooterView alloc] init];
    [self.contentView addSubview:cellFooterView];
    self.cellFooterView = cellFooterView;
    
    ///5: 添加选择规格的按钮信息
    UIButton *specBtn =[FSLButton createBtnWithTitle:@"选择规格>" titleFont:14 titleColor:[UIColor blackColor] imageName:@""];
    [self.contentView addSubview:specBtn];
    self.changeBuySpec = specBtn;
    
    
    /// 6:添加对应的剩余数据信息
    UILabel  *residutCount = [FSLLabel labelWithText:@"库存" textFont:14 andTextColor:[UIColor blackColor] andTextAligment:NSTextAlignmentCenter backGroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:residutCount];
    self.residutCount = residutCount ;
    
    ///7: 添加改变对应的价格属性
    UILabel *priceLabel = [FSLLabel labelWithText:@"￥" textFont:14 andTextColor:UIColor.redColor andTextAligment:NSTextAlignmentLeft backGroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:priceLabel];
    self.priceLabel = priceLabel;
    
    UILabel *paritiesLabel = [FSLLabel labelWithText:@"价格比例" textFont:14 andTextColor:UIColor.grayColor andTextAligment:NSTextAlignmentLeft backGroundColor:[UIColor grayColor]];
    [self.contentView addSubview:paritiesLabel];
    self.paritiesLabel = paritiesLabel;
    
    ///8： 改变view的属性信息
    FSLGoodsChangeCountView *amendTextView =[[FSLGoodsChangeCountView alloc] init];
        __weak __typeof__(self) weakSelf = self;
    amendTextView.textFieldBlock = ^{
      /// 执行操作
        weakSelf.callBackBlockText(weakSelf.model);
    };
    amendTextView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:amendTextView];
    self.amendTextView = amendTextView;
    
}



-(void)setModel:(DetailModel *)model {
    _model = model ;

    if (self.mangerCellSelectOrNot == false) {
        [self.selectBtn setImage:self.model.selectOrNot == false ?
         [UIImage imageNamed:@"ic_g_g"] :  [UIImage imageNamed:@"hfht"]
                        forState:UIControlStateNormal];
    }else {
        [self.selectBtn setImage:self.model.mangerSelectOrNot == false ?
         [UIImage imageNamed:@"ic_g_g"] :  [UIImage imageNamed:@"hfht"]
                        forState:UIControlStateNormal];
    }

    
    self.nameLabel.text = model.proname;

    self.priceLabel.text = [NSString stringWithFormat:@"￥%.0f",model.price];
    self.amendTextView.detailModel = self.model;
}

-(void)creatUILayout {
    /// 头部控件布局信息
    [self.cellHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_equalTo(0);
        make.top.equalTo(self.mas_top).mas_equalTo(0);
        make.right.equalTo(self.mas_right).mas_equalTo(0);
        make.height.mas_equalTo(40);
        
    }];
    
    
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.height.height.equalTo(@30);
        make.width.width.equalTo(@50);
    }];
    
    /// 底部控件布局信息
    [self.cellFooterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.height.equalTo(@40);
    }];
    
    /// 配置商品照片信息
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectBtn.mas_right).offset(10);
        make.top.equalTo(self.cellHeaderView.mas_bottom).offset(5);
        make.bottom.equalTo(self.cellFooterView.mas_top).offset(-5);
        make.width.mas_equalTo(70);
        
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
//        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.top.equalTo(self.iconImageView.mas_top).mas_offset(0);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
    
    
    ///5： 配置选择规格的信息内容
    [self.changeBuySpec mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left).offset(10);
        make.top.equalTo(self.nameLabel.mas_bottom).offset (3);
        make.right.equalTo(self.nameLabel.mas_right).offset(-20);
        make.height.mas_equalTo(30);
    }];
    
    
    ///6": 配置右侧的库存显示内容
    [self.residutCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_top).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.width.equalTo(@40);
        make.height.equalTo(@30);
        
    }];

//    ///7: 配置价格展示内容
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left).offset(0);
        make.top.equalTo(self.changeBuySpec.mas_bottom).offset(0);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    
    
    ////8: 配置数字填充内容展示
    [self.amendTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_top).offset(0);
        make.right.equalTo(self.mas_right).offset(-25);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 处理点击或者逻辑事件信息 ，采用通知或者block执行？？
-(void)pressSelectBtn:(UIButton *)btn  {
    
    if (self.mangerCellSelectOrNot == false) {
        self.model.selectOrNot = !self.model.selectOrNot;
        [self.selectBtn setImage:self.model.selectOrNot == false ?
         [UIImage imageNamed:@"ic_g_g"] :  [UIImage imageNamed:@"hfht"]
                        forState:UIControlStateNormal];
        /// 使用block 进行回调信息
    }else  if(self.mangerCellSelectOrNot == true ) {
        self.model.mangerSelectOrNot = !self.model.mangerSelectOrNot ;
        [self.selectBtn setImage:self.model.mangerSelectOrNot == false ?
         [UIImage imageNamed:@"ic_g_g"] :  [UIImage imageNamed:@"hfht"]
                        forState:UIControlStateNormal];
    }

    _callBackBlockText(self.model);
    
}

@end
