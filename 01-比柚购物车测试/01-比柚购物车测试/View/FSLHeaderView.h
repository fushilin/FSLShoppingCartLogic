//
//  FSLHeaderView.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataShowModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^allSelectBollCallBack) (DataShowModel *model);

@interface FSLHeaderView : UITableViewHeaderFooterView

///数据入口，
/**数据model*/
@property(nonatomic,strong) DataShowModel *showModel;

/** blcok内容*/
@property (nonatomic,copy) allSelectBollCallBack allSeclectBack;


/// 数据出口
/**manger控制信息*/
@property(nonatomic,assign) BOOL mangerHeaderSelectOrNot ;



/// 按钮点击时间

@end

NS_ASSUME_NONNULL_END
