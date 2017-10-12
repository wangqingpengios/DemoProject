//
//  NBBHomeHeadSectionView.m
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "NBBHomeHeadSectionView.h"


@interface NBBHomeHeadSectionView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *bigIconImageView;

@property (nonatomic, strong) UIImageView *leftLineImageView;

@property (nonatomic, strong) UIImageView *rightLineImageView;

@end


@implementation NBBHomeHeadSectionView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
    
        [self setupUI];
    }

    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel = [UILabel qp_labelWithText:@"热销套餐" color:[UIColor qp_colorWithHex:0x333333] fontSize:16];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
    
    self.bigIconImageView = [[UIImageView alloc]init];
    self.bigIconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:self.bigIconImageView];
    [self.bigIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLabel.mas_left).offset(-5.5);
        make.size.mas_equalTo(20);
        make.centerY.equalTo(self.titleLabel);
    }];
    
    
    self.leftLineImageView = [[UIImageView alloc]init];
    self.leftLineImageView.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.leftLineImageView];
    [self.leftLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bigIconImageView.mas_left).offset(-6);
        make.size.mas_equalTo(20);
        make.centerY.equalTo(self.bigIconImageView);
    }];
    
    self.rightLineImageView = [[UIImageView alloc]init];
    self.rightLineImageView.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.rightLineImageView];
    [self.rightLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(6);
        make.size.mas_equalTo(20);
        make.centerY.equalTo(self.titleLabel);
    }];
}

@end
