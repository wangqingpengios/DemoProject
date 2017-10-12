//
//  NSAttributedString+Additions.h
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  给NSAttributedString添加许多有用的方法
 */

@interface NSAttributedString (Additions)

/* e.g
 UIbutton * btn = xxxx;
 UIImage * image = [UIImage imageNamed:@"xxx"];
 NSAttributedString * attr = [NSAttributedString qp_imageTextWithImage:image imageWH:43 title:xxx fontSize:xx titleColor:[UIColor qp_colorWithHex:0xfcfcfc] spacing:xx];
 //设置按钮的文本属性
 [btn setAttributedTitle:attr forState:UIControlStateNormal];
*/

/// 使用图像和文本生成上下排列的属性文本
///   @param image      图像
///   @param imageWH    图像宽高
///   @param title      标题文字
///   @param fontSize   标题字体大小
///   @param titleColor 标题颜色
///   @param spacing    图像和标题间距
///   @return 属性文本
+ (instancetype)qp_imageTextWithImage:(UIImage *)image
                              imageWH:(CGFloat)imageWH
                                title:(NSString *)title
                             fontSize:(CGFloat)fontSize
                           titleColor:(UIColor *)titleColor
                              spacing:(CGFloat)spacing;

@end
