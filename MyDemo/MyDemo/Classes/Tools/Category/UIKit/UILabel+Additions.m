//
//  UILabel+Additions.m
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)


+ (instancetype)qp_labelWithText:(NSString *)text  color:(UIColor *)color  fontSize:(CGFloat)fontSize {
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    
    return label;
}

@end
