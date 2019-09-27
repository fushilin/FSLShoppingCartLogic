//
//  DetailModel.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

-(NSInteger)cellHeight {
    
  
    
    /// 判断数据比对信息
    if ([self.activity isEqualToString:@"0"]) {
        return 180;
    }else if([self.activity isEqualToString:@"1"]) {
        return 150;
    }else {
        return 0;
    }
    
    
}

@end

