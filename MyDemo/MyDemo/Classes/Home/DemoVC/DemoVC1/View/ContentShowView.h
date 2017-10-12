//
//  ContentShowView.h
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContentShowView;

@protocol ContentShowViewDelegate <NSObject>

- (void)contentShowView:(ContentShowView *)contentShowView ClickButtonWithTag:(NSInteger)tag;

@end


@interface ContentShowView : UIView

@property (nonatomic, weak) id<ContentShowViewDelegate> delegate;

/*! 全view透明按钮  */
@property (nonatomic, strong) UIButton *button;

/*! 内容图片视图， 接受外界图片  */
@property (nonatomic, strong) UIImageView *contentImageView;


@end
