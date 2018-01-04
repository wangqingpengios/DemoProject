//
//  TagView.m
//  CustomTag
//
//  Created by za4tech on 2017/12/15.
//  Copyright © 2017年 Junior. All rights reserved.
//

#import "TagView.h"
#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
@interface TagView ()
@property (nonatomic, strong) UIButton *markBtn;
@end
@implementation TagView




-(void)setArr:(NSArray *)arr{
    _arr = arr;
    CGFloat marginX = 5;
    CGFloat marginY = 5;
    CGFloat height = 10;
//    UIButton * markBtn;
    for (int i = 0; i < _arr.count; i++) {
        CGFloat width =  [self calculateString:_arr[i] Width:12] ;
        UIButton * tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (!_markBtn) {
            tagBtn.frame = CGRectMake(marginX, marginY, width, height);
        }else{
            if (_markBtn.frame.origin.x + _markBtn.frame.size.width + marginX + width + marginX > self.bounds.size.width) {
                tagBtn.frame = CGRectMake(marginX, _markBtn.frame.origin.y + _markBtn.frame.size.height + marginY, width, height);
            }else{
                tagBtn.frame = CGRectMake(_markBtn.frame.origin.x + _markBtn.frame.size.width + marginX, _markBtn.frame.origin.y, width, height);
            }
        }
        [tagBtn setTitle:_arr[i] forState:UIControlStateNormal];
        tagBtn.titleLabel.font = [UIFont systemFontOfSize:12];
//        [tagBtn setTintColor:[UIColor redColor]];
//        [tagBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tagBtn setTitleColor:UIColorFromRGB(0x56d176) forState:UIControlStateNormal];
        _markBtn = tagBtn;
        
        [tagBtn addTarget:self action:@selector(clickTo:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_markBtn];
    }
    CGRect rect = self.frame;
    rect.size.height = _markBtn.frame.origin.y + _markBtn.frame.size.height + marginY;
    self.frame = rect;
}

-(void)clickTo:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(handleSelectTag:)]) {
        [self.delegate handleSelectTag:sender.titleLabel.text];
    }
}



-(void)makeCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor layer:(CALayer *)layer borderWidth:(CGFloat)borderWidth
{
    layer.cornerRadius = radius;
    layer.masksToBounds = YES;
    layer.borderColor = borderColor.CGColor;
    layer.borderWidth = borderWidth;
}

-(CGFloat)calculateString:(NSString *)str Width:(NSInteger)font
{
    CGSize size = [str boundingRectWithSize:CGSizeMake(self.bounds.size.width, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size;
    return size.width;
}
@end
