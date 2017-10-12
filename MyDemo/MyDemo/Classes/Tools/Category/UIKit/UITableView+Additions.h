//
//  UITableView+Additions.h
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

///给tableView添加许多有用的方法
@interface UITableView (Additions)

/**
 *  UITableView初始化
 */
+ (UITableView *)initWithFrame:(CGRect)frame                                    // 结构
                         style:(UITableViewStyle)style                          // 风格
            cellSeparatorStyle:(UITableViewCellSeparatorStyle)cellSeparatorStyle// 分割线风格
                separatorInset:(UIEdgeInsets)separatorInset                     // 边缘偏移
                    dataSource:(id <UITableViewDataSource>)dataSource           // 数据源
                      delegate:(id <UITableViewDelegate>)delegate;              // 委托


@end
