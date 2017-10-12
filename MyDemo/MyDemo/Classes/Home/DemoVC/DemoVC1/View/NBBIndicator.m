//
//  NBBIndicator.m
//  MyDemo
//
//  Created by home on 2017/9/4.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "NBBIndicator.h"

@implementation NBBIndicator

+ (instancetype)sharedIndicator {
    
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/5*3+20, 5, 16, 16)];
        
    });
    
    return instance;
}

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;

}

- (void)setupUI {
    
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor qp_colorWithHex:0xfe5050];
    [self setFont:[UIFont systemFontOfSize:8]];
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor whiteColor];
}

- (void)setTotalCount:(NSNumber *)totalCount {
    _totalCount = totalCount;
    self.text = totalCount.description;
    self.hidden = !totalCount.integerValue;
    self.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {

    }];
}

@end
