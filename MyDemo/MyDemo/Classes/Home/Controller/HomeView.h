//
//  HomeView.h
//  MyDemo
//
//  Created by home on 2017/8/9.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectRowBlock)(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray,NSInteger index);

@interface HomeView : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) selectRowBlock selectBlock;

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock;

@end
