//
//  DetailModel.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 "activity" : "0",
 "img" : "img/y.jpg",
 "price" : 158,
 "proname" : "天天特价S925银渐变天鹅项链吊坠女纯银锁骨链韩版简约生日送女友",
 "type" : "饰品"
 */

@interface DetailModel : NSObject
/** 活动*/
@property (nonatomic,copy) NSString *activity;

/** image信息*/
@property (nonatomic,copy) NSString *img;

/** 价格*/
@property (nonatomic,assign) CGFloat   price;


/** 名称*/
@property (nonatomic,copy) NSString *proname;


/** 类型*/
@property (nonatomic,copy) NSString *type;


/// 添加height

/** 商品ID*/
@property (nonatomic,copy) NSString *goodsId;

/** 价格*/
@property (nonatomic,assign) NSInteger   cellHeight;


/**优惠券价格*/
@property(nonatomic,assign) NSUInteger  discountCoupon ;

/**优惠券数量*/
@property(nonatomic,assign) NSUInteger  discountCouponCount ;




/**
 "warehouseCount" : 20,
 "goodsCount":10
 */
/** 库存*/
@property (nonatomic,assign) NSInteger   warehouseCount;


/** 已经具有的数量*/
@property (nonatomic,assign) NSUInteger  goodsCount;



/**声明对应的选择控件*/
@property(nonatomic,assign) BOOL  selectOrNot ; 


/**声明编辑状态下的bool信息*/
@property(nonatomic,assign)  BOOL  mangerSelectOrNot ;



@end

NS_ASSUME_NONNULL_END
