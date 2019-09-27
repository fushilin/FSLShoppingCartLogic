//
//  GoodsDeleteView.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/27.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void (^shoppIngeCareDeleteSeleteBtnClike)(BOOL shoppingDeleBool);

/// 再来一个删除的按钮信息Block
typedef void  (^shoppingCartDeleteBtnClike)(void);

@interface GoodsDeleteView : UIView

/**删除的按钮的状态变化*/
@property(nonatomic,weak) UIButton *mangerDeleteBtn ;

/**修改对应的按钮状态的BOOL*/
@property(nonatomic,assign) BOOL  mangerDeleteSelectOrNot ;

/** 删除选择按钮*/
@property (nonatomic,copy) shoppingCartAllSelectBtnClike  shoppingCartAllSelectClikeBlock;

/** 删除数据按钮*/
@property (nonatomic,copy) shoppingCartDeleteBtnClike shoppingCartDeleBtnBlock;

@end

NS_ASSUME_NONNULL_END
