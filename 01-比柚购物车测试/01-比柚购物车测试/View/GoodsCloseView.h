//
//  GoodsCloseView.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/25.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
///1 : 定义block回调信息
//typedef void(^CallBackBlock) (DetailModel * _Nullable model);

/// 定义block的操作
typedef void (^shoppingCartAllSelectBtnClike)(BOOL shoppAllSelect) ;

@interface GoodsCloseView : UIView


/** 声明回调选择信息*/
@property (nonatomic,copy) shoppingCartAllSelectBtnClike shoppingCartSelectBtnBlock;


/// 一个Bool值信息
/**选择与否的BoolX信息*/
@property(nonatomic,assign) BOOL  shoppAllSelectBool ;

/**显示的price 信息*/
@property(nonatomic,weak) UILabel *shoppingPriceLabel ;


/** PriceString*/
@property (nonatomic,copy) NSString  *priceTextString;


/// manger控制器信息
/**manger控制器信息*/
@property(nonatomic,assign) BOOL  mangerCloseSelect ;



@end

NS_ASSUME_NONNULL_END
