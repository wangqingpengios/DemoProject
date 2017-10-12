//
//  ListView.h
//  MyDemo
//
//  Created by home on 2017/8/30.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickListView)(NSInteger index);

@interface ListView : UIView


@property (nonatomic, copy) ClickListView  clickListView;

@property (nonatomic, strong) UITableView *tableView;

@end
