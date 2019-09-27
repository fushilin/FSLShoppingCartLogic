//
//  ViewController.m
//  01-比柚购物车测试
//
//  Created by 我演示 on 2019/9/23.
//  Copyright © 2019 我演示. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "DataShowModel.h"
#import "DetailModel.h"
#import "FSLHeaderView.h"
#import "FSLGoodsCell.h"


/// 底部的结算按钮信息


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
/**数据源*/
@property(nonatomic,strong) NSMutableArray *dataSource;

/**TableView*/
@property(nonatomic,strong) UITableView *tableView;


/**结算view信息*/
@property(nonatomic,strong ) GoodsCloseView *closeView ;

/**删除的view展示*/
@property(nonatomic,strong ) GoodsDeleteView *deleteView ;



/// 添加一个编辑View的按钮s
/**改变的view信息*/
@property(nonatomic,strong) UIView *manageView;
/**选择按钮信息*/
@property(nonatomic,weak) UIButton *mangerDeleteBtn ;

/**mangerBool*/
@property(nonatomic,assign)  BOOL  mangerSelect ;



@end

@implementation ViewController


-(GoodsCloseView *)closeView {
    if (!_closeView) {
       _closeView = [[GoodsCloseView alloc]initWithFrame:CGRectMake(0, UIScreen.mainScreen.bounds.size.height -69, self.view.fsl_width, 49)];
        _closeView.hidden = false ;
        __weak __typeof__(self) weakSelf = self;
        _closeView.shoppingCartSelectBtnBlock = ^(BOOL shoppAllSelect) {
            /// 处理信息
            /// 首先判断有没有信息，如果有数据，就处理 非信息处理
            if (weakSelf.dataSource.count > 0 ) {
                
                if (shoppAllSelect == true) {
                    /// 循环数据处理
                    for ( DataShowModel *showModel  in weakSelf.dataSource) {
                        showModel.allSelectType = shoppAllSelect;
                        for (DetailModel *detailModel in showModel.data) {
                            detailModel.selectOrNot = shoppAllSelect;
                            /// 参数累加 货品和价格计算数据
                        }
                    }
                    /// 保留两位小数
                    
                }
                else  if( shoppAllSelect == false ) {
                    for ( DataShowModel *showModel  in weakSelf.dataSource) {
                        showModel.allSelectType = shoppAllSelect;
                        for (DetailModel *detailModel in showModel.data) {
                            detailModel.selectOrNot = shoppAllSelect;
                            /// 参数累加 货品和价格计算数据
                            /// 统计数据
                            
                        }
                    }
                }
            };
            
            [weakSelf totalFooterViewChangePriceFooterPrcie];
            
            [weakSelf.tableView reloadData];
            
            
        };
        
    }
    return  _closeView;
}

-(GoodsDeleteView *)deleteView {
    if (!_deleteView) {
        
        _deleteView = [[GoodsDeleteView alloc] initWithFrame:CGRectMake(0, UIScreen.mainScreen.bounds.size.height -69, self.view.fsl_width, 49)];
        _deleteView.backgroundColor = [UIColor grayColor];
        _deleteView.hidden = true ;
          __weak __typeof__(self) weakSelf = self;
        
        /// 删除数据的按钮信息
        _deleteView.shoppingCartDeleBtnBlock = ^{
            
            /// 使用删除数据的时刻，不能使用forin循环，只能使用for循环处理
            
            for ( int k= 0; k < weakSelf.dataSource.count ; k++) {
                
                DataShowModel *showModel = weakSelf.dataSource[k];
                for (int i = 0; i< showModel.data.count; i++) {
                    DetailModel *detail = showModel.data[i];
                    if (detail.mangerSelectOrNot == true) {
                        [showModel.data removeObject:detail];
                    }
                }
                if (showModel.mangerAllSelectType == true) {
                    [weakSelf.dataSource removeObject:showModel];
                }
                
            }
            [weakSelf.tableView reloadData];
        };
        
        
        _deleteView.shoppingCartAllSelectClikeBlock = ^(BOOL shoppAllSelect) {
                /// 首先判断有没有信息，如果有数据，就处理 非信息处理
                if (weakSelf.dataSource.count > 0 ) {
                    
                    if (shoppAllSelect == true) {
                        /// 循环数据处理
                        for ( DataShowModel *showModel  in weakSelf.dataSource) {
                            showModel.mangerAllSelectType = shoppAllSelect;
                            for (DetailModel *detailModel in showModel.data) {
                                detailModel.mangerSelectOrNot = shoppAllSelect;
                                /// 参数累加 货品和价格计算数据
                            }
                        }
                        /// 保留两位小数
                        
                    }
                    else  if( shoppAllSelect == false ) {
                        for ( DataShowModel *showModel  in weakSelf.dataSource) {
                            showModel.mangerAllSelectType = shoppAllSelect;
                            for (DetailModel *detailModel in showModel.data) {
                                detailModel.mangerSelectOrNot = shoppAllSelect;
                                /// 参数累加 货品和价格计算数据
                                /// 统计数据
                            }
                        }
                    }
                };
                [weakSelf.tableView reloadData];
            
        };
     
    }
    return _deleteView;
    

}

/// 1 : 创造数据源

-(NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        
        /// 1: 获取x解析数据
        NSString *bundleString = [[NSBundle mainBundle] pathForResource:@"goodsJson" ofType:@"json"];
        
        NSData *jsonData = [NSData dataWithContentsOfFile:bundleString];
        
       
        NSArray *dataArray =  [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray *dataSourceArray = [NSMutableArray array];
        for (int i =0 ; i< dataArray.count; i++) {
            
            DataShowModel *model = [DataShowModel mj_objectWithKeyValues:dataArray[i]];
            NSLog(@"--%@-",model.home);
            [dataSourceArray addObject:model];
        
        }
        
        /// 数据源赋值
        
        _dataSource = dataSourceArray ;
        
        
    }
    
    return  _dataSource;
}
-(UIView *)manageView {
    if (!_manageView) {
        _manageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 84)];
        _manageView.backgroundColor = [UIColor grayColor];
        self.mangerSelect = false ;
        UIButton *btn = [FSLButton createBtnWithTitle:@"管理" titleFont:14 titleColor:[UIColor blackColor] imageName:@""];
        btn.frame = CGRectMake(0, _manageView.frame.size.height-40, 80, 44);
        
        [btn addTarget:self action:@selector(pressMangerBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [_manageView addSubview:btn];
        self.mangerDeleteBtn = btn ;
        
    }
    return  _manageView;
}
-(void)pressMangerBtn:(UIButton *)btn {
    /// 改变对应的状态
    self.mangerSelect = !self.mangerSelect ;
    if (self.mangerSelect == false) {
        self.closeView.hidden = false ;
        self.deleteView.hidden = true ;
    } else if ( self.mangerSelect == true) {
        self.closeView.hidden = true ;
        self.deleteView.hidden = false ;
    }
    
    [self.mangerDeleteBtn setTitle:self.mangerSelect == false ? @"管理":@"完成" forState:UIControlStateNormal];
    /// 还需要添加一个属性控制、。。。
    if (self.mangerSelect == false) {
        for (DataShowModel *showModel in self.dataSource) {
            showModel.mangerAllSelectType = false ;
            for (DetailModel *detailModel in showModel.data) {
                detailModel.mangerSelectOrNot = false ;
            }
            
        }
    }
    
    [self.tableView reloadData];
    
}

/// 2:  创造tableView
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}

/// 3: 创造对应的cell的信息内容




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    NSLog(@"%@",self.dataSource);
    [self.tableView reloadData];
    
    CGRect tempRect = self.view.frame;
    tempRect.size.height = 10.f;
    self.view.frame = tempRect;
    
    [self.view addSubview:self.manageView];
    /// 加一个全选的view信息
    


    [self.view addSubview:self.closeView];

    [self.view addSubview:self.deleteView];
    /// 增加对应的block的信息

    
    

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataSource.; 层级分明
    DataShowModel *model  = self.dataSource[section];
    return model.data.count;
    
}

/// 创建协议和代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DataShowModel *model  = self.dataSource[indexPath.section];
    DetailModel *detailModel = model.data[indexPath.row];
    FSLGoodsCell *cell = [FSLGoodsCell cellWithTableView:tableView];

    if (self.mangerSelect == false ) {
        cell.mangerCellSelectOrNot = false ;
    } else if ( self.mangerSelect == true ) {
        cell.mangerCellSelectOrNot = true ;
    }
    ///1： 点击单独cell的blcok信息 如果使用block 直接使用weakSelf的信息 ，时刻保证信息正确
    __weak __typeof__(self) weakSelf = self;
    
        cell.callBackBlockText = ^(DetailModel *models) {
            /// 比对数据 ,更改信息
            if(self.mangerSelect == false ){
                for (DataShowModel *showModel in weakSelf.dataSource ) {
                    if ([showModel.data containsObject:models]) {
                        
                        NSInteger selectCount = 0 ;
                        if (models.selectOrNot == false) {
                            showModel.allSelectType = false ;
                        }else {
                            
                            for (DetailModel *selectDetailModel in showModel.data) {
                                
                                if (selectDetailModel.selectOrNot == true) {
                                    /// 数据统计
                                    selectCount ++ ;
                                }
                            }
                            /// 数据线路判断信息 数据判断结束
                            if (selectCount == showModel.data.count) {
                                showModel.allSelectType = true ;
                            }
                        }
                    }
                }
                [weakSelf totalFooterViewChangePriceFooterPrcie];
                [weakSelf.tableView reloadData];
            } else if(self.mangerSelect == true ){
                for (DataShowModel *showModel in weakSelf.dataSource ) {
                    if ([showModel.data containsObject:models]) {
                        
                        NSInteger selectCount = 0 ;
                        if (models.mangerSelectOrNot == false) {
                            showModel.mangerAllSelectType = false ;
                        }else {
                            for (DetailModel *selectDetailModel in showModel.data) {
                                
                                if (selectDetailModel.mangerSelectOrNot == true) {
                                    /// 数据统计
                                    selectCount ++ ;
                                }
                            }
                            /// 数据线路判断信息 数据判断结束
                            if (selectCount == showModel.data.count) {
                                showModel.mangerAllSelectType = true ;
                            }
                        }
                    }
                }
                [weakSelf totalFooterViewChangePriceFooterPrcie];
                
                [weakSelf totalDeleteViewChangeDleteGoodsCount];
                [weakSelf.tableView reloadData];
            }
         
            
        };



    

    
    cell.model = detailModel;
    return  cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 41;
}

/// 复用headerView的信息
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    DataShowModel *showModel = self.dataSource[section];
    NSLog(@"header = %@",showModel.home);
    static NSString *headerIdenty = @"header";
    
    FSLHeaderView *headerView =    [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdenty];
    if (headerView == nil) {
        headerView =[[FSLHeaderView alloc] initWithReuseIdentifier:headerIdenty];
    }
    headerView.mangerHeaderSelectOrNot = self.mangerSelect ;
    
    headerView.showModel = showModel;
    
  
    /// 拿取数据datal信息
    headerView.contentView.backgroundColor =[UIColor whiteColor];
    __weak __typeof__(self) weakSelf = self;
        headerView.allSeclectBack = ^(DataShowModel * _Nonnull model) {
            /// 数据变量
            /// 更改数据类型
            
            if (self.mangerSelect == false ){
                for (DataShowModel *showModel in self.dataSource) {
                    if ([showModel.home  isEqualToString:model.home ]) {
                        if (showModel.allSelectType == true) {
                            for (DetailModel *detailModel in showModel.data) {
                                detailModel.selectOrNot = true ;
                            }
                        }else {
                            for (DetailModel *detailModel in showModel.data) {
                                detailModel.selectOrNot = false ;
                            }
                        }
                    }
                }
                [weakSelf totalFooterViewChangePriceFooterPrcie];
                /// 计算价格与计算按钮状态是同时计算的？但是如果没有计算价格的时候，
                /// 编辑状态下，total 状态隐藏，改变数据 ，但是这个数据的保留状态仍然需要
                
                [weakSelf.tableView reloadData];
                
            }else if (self.mangerSelect == true ) {
                for (DataShowModel *showModel in self.dataSource) {
                    if ([showModel.home  isEqualToString:model.home ]) {
                        if (showModel.mangerAllSelectType == true) {
                            for (DetailModel *detailModel in showModel.data) {
                                detailModel.mangerSelectOrNot = true ;
                            }
                        }else {
                            for (DetailModel *detailModel in showModel.data) {
                                detailModel.mangerSelectOrNot = false ;
                            }
                        }
                    }
                }
                [weakSelf totalFooterViewChangePriceFooterPrcie];
                /// 计算价格与计算按钮状态是同时计算的？但是如果没有计算价格的时候，
                /// 编辑状态下，total 状态隐藏，改变数据 ，但是这个数据的保留状态仍然需要
                [weakSelf totalDeleteViewChangeDleteGoodsCount];
                [weakSelf.tableView reloadData];
            }
       
        };
    
   
    return headerView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor =[UIColor grayColor];
    return headerView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DataShowModel *showModel = self.dataSource[indexPath.section] ;
    DetailModel *detailModel = showModel.data[indexPath.row];
    return detailModel.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

// 监听tableView 的辩护
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    [self.view endEditing:true];

}

#pragma mark -改变最后的价格

/**
 计算总价的处理信息
 */
-(void)totalFooterViewChangePriceFooterPrcie {
    
       CGFloat totalPrice = 0.0 ;
    
    /// 统计整个选择的状态信息
    NSInteger selectAlllCount = 0 ;
    
    for ( DataShowModel *showModel  in self.dataSource) {
        for (DetailModel *detailModel in showModel.data) {
            /// 参数累加 货品和价格计算数据
            /// 统计数据
            if (detailModel.selectOrNot == true) {
                totalPrice += detailModel.price * detailModel.goodsCount ;
                totalPrice -= detailModel.discountCoupon * detailModel.discountCouponCount ;
            }
        }
        if (showModel.allSelectType == true) {
            selectAlllCount += 1;
        }
    }
    /// 循环处理了
    
    if (self.dataSource.count == selectAlllCount) {
        self.closeView.shoppAllSelectBool = true;
    }else {
        self.closeView.shoppAllSelectBool = false;
    }
    self.closeView.priceTextString = [NSString stringWithFormat:@"%.2f",totalPrice] ;
}


/**
 统计删除数量
 */
-(void)totalDeleteViewChangeDleteGoodsCount {
 
    /// 统计整个选择的状态信息
    NSInteger selectAlllCount = 0 ;
    
    for ( DataShowModel *showModel  in self.dataSource) {
        if (showModel.mangerAllSelectType == true) {
            selectAlllCount += 1;
        }
    }
    /// 被循环处理了
    
    if (self.dataSource.count == selectAlllCount) {
        self.deleteView.mangerDeleteSelectOrNot = true;
    }else {
        self.deleteView.mangerDeleteSelectOrNot = false;
    }
}

@end
