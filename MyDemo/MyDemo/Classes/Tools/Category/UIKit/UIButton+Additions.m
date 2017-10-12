//
//  UIButton+Additions.m
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "UIButton+Additions.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, copy) CallBackBlock  actionBlock;

@end

@implementation UIButton (Additions)

#pragma mark - button添加block事件

- (void)setActionBlock:(CallBackBlock)actionBlock {
    
    objc_setAssociatedObject(self, _cmd, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CallBackBlock)actionBlock {
    return objc_getAssociatedObject(self, @selector(setActionBlock:));
}

- (void)addActionHandle:(CallBackBlock)block {
    
    self.actionBlock = block;
    
    [self addTarget:self action:@selector(didClickAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClickAction:(UIButton *)sender {
    
    if (self.actionBlock) {
        
        self.actionBlock(sender);
    }
}

#pragma mark - ----------------设置button响应区域大小----------------

- (void)setEventFrame:(CGSize)eventFrame{
    NSString *eventFramStr = NSStringFromCGSize(eventFrame);
    objc_setAssociatedObject(self, _cmd, eventFramStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (CGSize)eventFrame{
    NSString *eventFramStr = objc_getAssociatedObject(self, @selector(setEventFrame:));
    return CGSizeFromString(eventFramStr);
}

- (void)setMinEventTouchSize:(CGSize)minSize{
    self.eventFrame = minSize;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event{
    CGRect bounds = self.bounds;
    CGFloat widthExtra = MAX(self.eventFrame.width - bounds.size.width, 0);
    CGFloat heightExtra = MAX(self.eventFrame.height - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthExtra, -0.5 * heightExtra);
    return CGRectContainsPoint(bounds, point);
    
}

#pragma mark - 快速创建一个按钮
+ (instancetype)qp_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage {
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button sizeToFit];
    
    return button;
}


@end
