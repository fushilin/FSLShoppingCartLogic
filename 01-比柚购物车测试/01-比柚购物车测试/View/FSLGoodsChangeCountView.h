//
//  FSLGoodsChangeCountView.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/25.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

///只执行改变，不改变其他
typedef void(^textFieldChangeBlock) () ;

@interface FSLGoodsChangeCountView : UIView

/** model 数据*/
@property(nonatomic,strong) DetailModel *detailModel;


/// 定义执行的block 信息内容

/** block*/
@property (nonatomic,copy) textFieldChangeBlock textFieldBlock;


@end

NS_ASSUME_NONNULL_END
