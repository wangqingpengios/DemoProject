//
//  UIViewController+AddChildVC.h
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AddChildVC)

/**
 *  添加子控制器
 *
 *  @param childVc     要添加的子控制器
 *  @param contentView 子控制器view的父控件
 */
- (void)qp_addChildViewController:(UIViewController *)childVc intoView:(UIView *)contentView;

/*
     e.g:
 //返回一个scrollview
 - (UIScrollView * ) setupContentView {
 // 创建滚动视图
 UIScrollView *scrollView = [[UIScrollView alloc] init];
 // 设置分页效果
 scrollView.pagingEnabled = YES;
 // 禁止弹簧效果
 scrollView.bounces = NO;
 // 设置代理
 scrollView.delegate = self;
 
 // 添加内容视图
 UIView *contentView = [[UIView alloc] init];
 contentView.backgroundColor = [UIColor whiteColor];
 [scrollView addSubview:contentView];
 
 // 添加约束:contentView
 [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
 // 设置bounds
 make.edges.equalTo(scrollView);
 // 下面两行代码确定滚动范围
 make.width.mas_equalTo(scrollView).multipliedBy(3);
 make.height.mas_equalTo(scrollView);
 }];
 // 控制器数组
 NSArray *vcs = @[@"KZYSubmitted",@"KZYServiceController",@"KZYCompleted"];
 NSInteger index = 0;
 // 遍历数组
 for (NSString *vcName in vcs) {
 // 将控制器字符串名转成Class
 Class class = NSClassFromString(vcName);
 // 断言
 NSAssert( [class isSubclassOfClass:[UIViewController class]], @"不是控制器");
 // 创建控制器
 UIViewController *vc =  [[class alloc] init];
 // 添加子控制器
 [self qp_addChildViewController:vc intoView:contentView];
 // 获得屏幕的宽度
 CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
 // 添加约束
 [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
 make.top.bottom.equalTo(contentView);
 make.width.mas_equalTo(scrollView);
 make.left.mas_equalTo(scrollView).offset(screenW * index);
 }];
 // 索引 ++
 index ++;
 }
 
 return scrollView;
 }
 
*/
@end
