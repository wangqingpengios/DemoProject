//
//  UIButton+Additions.h
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CallBackBlock)(UIButton *button) ;

@interface UIButton (Additions)

///button添加block事件
- (void)addActionHandle:(CallBackBlock)block;

///设置button响应区域大小(小于此区域则放大，否则保持原大小不变，不赋值保持大小不变，center相同)
- (void)setMinEventTouchSize:(CGSize)minSize;


/// 创建文本按钮
/// @param title         文本
/// @param fontSize      字体大小
/// @param normalColor   默认颜色
/// @param selectedColor 选中颜色
/// @param normalImage   图片
/// @param selectedImage 选中的图片
/// @return UIButton
+ (instancetype)qp_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage;

@end
