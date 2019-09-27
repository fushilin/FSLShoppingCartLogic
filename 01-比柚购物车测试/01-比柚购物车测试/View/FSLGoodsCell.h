//
//  FSLGoodsCell.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/24.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <UIKit/UIKit.h>


///1 : 定义block回调信息
typedef void(^CallBackBlock) (DetailModel * _Nullable model);

NS_ASSUME_NONNULL_BEGIN

@interface FSLGoodsCell : UITableViewCell


+(instancetype)cellWithTableView:(UITableView *)tableView;

/**model 数据*/
@property(nonatomic,strong) DetailModel *model;

///2: 声明blcok的回调

@property(nonatomic,copy ) CallBackBlock  callBackBlockText;


/**编辑管理状态下的状态数据*/
@property(nonatomic,assign)BOOL   mangerCellSelectOrNot ;



@end

NS_ASSUME_NONNULL_END
