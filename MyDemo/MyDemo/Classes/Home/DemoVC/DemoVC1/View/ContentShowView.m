//
//  ContentShowView.m
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "ContentShowView.h"

@implementation ContentShowView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.button.hidden = NO;
        
        self.contentImageView.hidden = NO;
    }
    
    return self;
}

- (UIImageView *)contentImageView {
    
    if (!_contentImageView) {
        
        _contentImageView = [[UIImageView alloc]init];
    
        [self addSubview:_contentImageView];
        
        _contentImageView.backgroundColor = [UIColor greenColor];
        
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(-1);
            make.top.left.mas_equalTo(1);
        }];
    }
    
    return _contentImageView;
}

- (UIButton *)button {
    
    if (!_button) {
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:_button];
        
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            
            _button.backgroundColor = [UIColor redColor];
            make.edges.equalTo(0);
        }];
        
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
- (void)buttonClick {
    
    if ([self.delegate respondsToSelector:@selector(contentShowView:ClickButtonWithTag:)]) {
        
        [self.delegate contentShowView:self ClickButtonWithTag:self.tag];
        
    }
}

@end
