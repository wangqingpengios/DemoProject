//
//  HNInFoHeadView.m
//  MyDemo
//
//  Created by home on 2018/1/2.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//

#import "HNInFoHeadView.h"
#import "CWStarRateView.h"
@interface HNInFoHeadView ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *distanceLabel;
@property (nonatomic, strong) UILabel *saleLabel;
@property (nonatomic, strong) CWStarRateView *starView;
@property (nonatomic, strong) UILabel *goodLabel;
@property (nonatomic, strong) UILabel *goodNumberLabel;
@end
@implementation HNInFoHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    self.iconImageView.hidden = NO;
    self.titleLabel.hidden = NO;
    self.addressLabel.hidden = NO;
    self.goodLabel.hidden = NO;
    self.distanceLabel.hidden = NO;
    self.goodNumberLabel.hidden = NO;
    self.saleLabel.hidden = NO;
    
    _starView = [[CWStarRateView alloc] initWithFrame:CGRectMake(0,0, 65, 14) numberOfStars:5];
    [self addSubview:_starView];
    _starView.scorePercent = 1;
    [_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_goodLabel.mas_right).offset(2);
        make.top.equalTo(_addressLabel.mas_bottom).offset(9);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(14);
    }];
    
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        [self addSubview:_iconImageView];
        _iconImageView.backgroundColor = [UIColor cyanColor];
        _iconImageView.layer.cornerRadius = 33;
        _iconImageView.layer.masksToBounds = YES;
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10.5);
            make.size.mas_equalTo(66);
        }];
    }
    return _iconImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel qp_labelWithText:@"溪边一个田" color:[UIColor blackColor] fontSize:16];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(12);
            make.left.equalTo(_iconImageView.mas_right).offset(12);
        }];
    }
    return _titleLabel;
}
- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel qp_labelWithText:@"地址： 浙江省杭州市江干区1800号" color:[UIColor grayColor] fontSize:12];
        [self addSubview:_addressLabel];
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(9.5);
            make.left.equalTo(_iconImageView.mas_right).offset(12);
        }];
    }
    return _addressLabel;
}
- (UILabel *)goodLabel {
    if (!_goodLabel) {
        _goodLabel = [UILabel qp_labelWithText:@"好评度:" color:[UIColor grayColor] fontSize:12];
        [self addSubview:_goodLabel];
        [_goodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_addressLabel.mas_bottom).offset(9);
            make.left.equalTo(_iconImageView.mas_right).offset(12);
        }];
    }
    return _goodLabel;
}
- (UILabel *)goodNumberLabel {
    if (!_goodNumberLabel) {
        _goodNumberLabel = [UILabel qp_labelWithText:@"5.0分" color:[UIColor yellowColor] fontSize:12];
        [self addSubview:_goodNumberLabel];
        [_goodNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_goodLabel.mas_right).offset(69);
            make.centerY.equalTo(_goodLabel);
        }];
    }
    return _goodNumberLabel;
}
- (UILabel *)distanceLabel {
    if (!_distanceLabel) {
        _distanceLabel = [UILabel qp_labelWithText:@"1.82km" color:[UIColor grayColor] fontSize:9];
        [self addSubview:_distanceLabel];
        [_distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-9);
            make.centerY.equalTo(_addressLabel);
        }];
    }
    return _distanceLabel;
}
- (UILabel *)saleLabel {
    if (!_saleLabel) {
        _saleLabel = [UILabel qp_labelWithText:@"月销:12" color:[UIColor grayColor] fontSize:9];
        [self addSubview:_saleLabel];
        [_saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-9);
            make.centerY.equalTo(_goodNumberLabel);
        }];
    }
    return _saleLabel;
}

@end
