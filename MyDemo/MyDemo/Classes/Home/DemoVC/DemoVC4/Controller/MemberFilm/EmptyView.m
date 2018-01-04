//
//  EmptyView.m
//  commendTest
//
//  Created by Alan on 2017/12/27.
//  Copyright © 2017年 景彦铭. All rights reserved.
//

#import "EmptyView.h"
#import <Masonry.h>
#import "Additions.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface EmptyView()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *actionBtn;

@end

@implementation EmptyView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.iconImageView = [[UIImageView alloc] init];
    //图片名字后期记得换！
    self.iconImageView.image = [UIImage imageNamed:@"changeCamera"];
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(135);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(53);
    }];
    
    self.descLabel = [UILabel qp_labelWithText:@"暂无视频~" color:UIColorFromRGB(0x999999) fontSize:15];
    [self addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(20);
        make.centerX.equalTo(self);
    }];
    
    self.actionBtn = [UIButton qp_textButton:@"添加视频" fontSize:15 normalColor:UIColorFromRGB(0x56d176) selectedColor:UIColorFromRGB(0x56d176) normalImage:nil selectedImage:nil];
    //图片名字后期记得加！
    [self.actionBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self addSubview:self.actionBtn];
    [self.actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-120);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
    }];
    [self.actionBtn setBordersWithColor:UIColorFromRGB(0x56d176) andCornerRadius:20 andWidth:1];
    [self.actionBtn addTarget:self action:@selector(clickAddBtn) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickAddBtn {
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
