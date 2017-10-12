//
//  UILabel+Additions.h
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Additions)

/// 快速创建一个简单的label
///
/// @param text     文本
/// @param color    颜色
/// @param fontSize 字体大小
///
/// @return UILabel
+ (instancetype)qp_labelWithText:(NSString *)text  color:(UIColor *)color  fontSize:(CGFloat)fontSize;
@end
