//
//  DataShowModel.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "DataShowModel.h"
#import "MJExtension.h"
#import "DetailModel.h"

@implementation DataShowModel

+(NSDictionary *)mj_objectClassInArray {
    
    return  @{@"data":@"DetailModel"};
    
}

//-(CGFloat )textWidth {
//   
//    if(size.width >= 180 ){
//        return 180;
//    }else {
//        return size.width;
//    }
//}


@end
