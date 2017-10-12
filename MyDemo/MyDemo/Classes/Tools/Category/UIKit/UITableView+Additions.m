//
//  UITableView+Additions.m
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "UITableView+Additions.h"

@implementation UITableView (Additions)


/**
 *  UITableView初始化
 */
+ (UITableView *)initWithFrame:(CGRect)frame                                    // 结构
                              style:(UITableViewStyle)style                          // 风格
                 cellSeparatorStyle:(UITableViewCellSeparatorStyle)cellSeparatorStyle// 分割线风格
                     separatorInset:(UIEdgeInsets)separatorInset                     // 边缘偏移
                         dataSource:(id <UITableViewDataSource>)dataSource           // 数据源
                           delegate:(id <UITableViewDelegate>)delegate {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView setSeparatorStyle:cellSeparatorStyle];
    [tableView setSeparatorInset:separatorInset];
    [tableView setDelegate:delegate];
    [tableView setDataSource:dataSource];
    
    return tableView;
}

@end
