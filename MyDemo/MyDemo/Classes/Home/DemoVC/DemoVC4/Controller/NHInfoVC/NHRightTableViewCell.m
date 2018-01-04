//
//  NHRightTableViewCell.m
//  MyDemo
//
//  Created by home on 2018/1/2.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//

#import "NHRightTableViewCell.h"
#import "CWStarRateView.h"

@interface NHRightTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *saleLabel;
@property (nonatomic, strong) CWStarRateView *starView;
@property (nonatomic, strong) UILabel *pirceLabel;
@property (nonatomic, strong) UILabel *goodNumberLabel;
@property (nonatomic, strong) UIButton *buyButton;
@end

@implementation NHRightTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.iconImageView.hidden = NO;
    self.titleLabel.hidden = NO;
    self.saleLabel.hidden = NO;
    self.goodNumberLabel.hidden = NO;
    self.pirceLabel.hidden = NO;
    self.buyButton.hidden = NO;
    
    _starView = [[CWStarRateView alloc] initWithFrame:CGRectMake(0,0, 65, 14) numberOfStars:5];
    [self addSubview:_starView];
    _starView.scorePercent = 1;
    [_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_saleLabel.mas_right).offset(15);
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(14);
    }];
    
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(65);
        }];
    }
    return _iconImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel qp_labelWithText:@"农家丝瓜1200g" color:UIColorFromRGB(0x333333) fontSize:14];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_iconImageView.mas_right).offset(10);
            make.top.equalTo(self.contentView).offset(15);
        }];
    }
    return _titleLabel;
}
- (UILabel *)saleLabel {
    if (!_saleLabel) {
        _saleLabel = [UILabel qp_labelWithText:@"月销:66" color:UIColorFromRGB(0x999999) fontSize:12];
        [self addSubview:_saleLabel];
        [_saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_iconImageView.mas_right).offset(10);
            make.top.equalTo(_titleLabel.mas_bottom).offset(6);
        }];
    }
    return _saleLabel;
}
- (UILabel *)goodNumberLabel {
    if (!_goodNumberLabel) {
        _goodNumberLabel = [UILabel qp_labelWithText:@"5.0分" color:UIColorFromRGB(0xffce22) fontSize:12];
        [self addSubview:_goodNumberLabel];
        [_goodNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-39);
            make.centerY.equalTo(_saleLabel);
        }];
    }
    return _goodNumberLabel;
}
- (UILabel *)pirceLabel {
    if (!_pirceLabel) {
        _pirceLabel = [UILabel qp_labelWithText:@"¥36.00元" color:UIColorFromRGB(0xff6c00) fontSize:14];
        [self addSubview:_pirceLabel];
        [_pirceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_iconImageView.mas_right).offset(10);
            make.top.equalTo(_saleLabel.mas_bottom).offset(10);
        }];
    }
    return _pirceLabel;
}
- (UIButton *)buyButton {
    if (!_buyButton) {
        _buyButton = [UIButton qp_textButton:@"" fontSize:0 normalColor:nil selectedColor:nil normalImage:@"nav_back" selectedImage:@""];
        [_buyButton addTarget:self action:@selector(clickShopping:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_buyButton];
        [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(_pirceLabel);
        }];
        _buyButton.tag = 1;
    }
    return _buyButton;
}

- (void)clickShopping:(UIButton *)sender {

    if (self.clickShopBtn) {
        self.clickShopBtn(self, sender.tag);
    }
}

@end
