//
//  DataShowModel.h
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailModel.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataShowModel : NSObject

/** 释义信息*/
@property (nonatomic,copy) NSString *home;

/**data 信息*/
@property(nonatomic,strong) NSMutableArray<DetailModel *> *data;

/// 自增加选择信息内容

/**select 内容信息*/
@property(nonatomic,assign) BOOL  allSelectType ;



/**编辑状态下的处理信息*/
@property(nonatomic,assign) BOOL  mangerAllSelectType ;



@end

NS_ASSUME_NONNULL_END
