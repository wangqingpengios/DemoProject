//
//  RurakThemeTableViewCell.m
//  MyDemo
//
//  Created by home on 2018/1/3.
//  Copyright © 2018年 qingpengwang. All rights reserved.

#import "RurakThemeTableViewCell.h"
#import "TagView.h"
@interface RurakThemeTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) TagView *tagView;
@property (nonatomic, strong) UIButton *goodBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *seeBtn;
@property (nonatomic, strong) UILabel *distanceLabel;
@end

@implementation RurakThemeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {

    
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(110);
    }];
    
    _titleLable = [UILabel qp_labelWithText:@"杭州西湖" color:UIColorFromRGB(0x333333) fontSize:15];
    [self.contentView addSubview:_titleLable];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(11.5);
        make.left.equalTo(_iconImageView.mas_right).offset(10);
    }];
    
    _addressLabel = [UILabel qp_labelWithText:@"杭州西湖区阳光大道1800号18001800180018001800" color:UIColorFromRGB(0x333333) fontSize:12];
    _addressLabel.numberOfLines = 2;
    [self.contentView addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLable.mas_bottom).offset(8);
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-15);
    }];

    //这里有问题 但是不影响
    //2018-1-3
    //新年里的第一个BUG 自定义View中的子控件的宽度没有参照view本身的宽度来参照
    self.tagView = [[TagView alloc] initWithFrame:CGRectMake(0, 0, 250, 0)];
    [self.contentView addSubview:self.tagView];
    self.tagView.arr = @[@"亲子",@"真好玩",@"稀奇事",@"有bug",@"测试中",@"真好玩",@"稀奇事",@"有bug",@"测试中"];
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(5);
        make.top.equalTo(_addressLabel.mas_bottom).offset(0);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(0);
    }];
    
    _goodBtn = [UIButton qp_textButton:@"30" fontSize:12 normalColor:UIColorFromRGB(0x999999) selectedColor:nil normalImage:@"icon_assets_select" selectedImage:nil];
    [self.contentView addSubview:_goodBtn];
    [_goodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 15));
    }];
    
    _commentBtn = [UIButton qp_textButton:@"2" fontSize:12 normalColor:UIColorFromRGB(0x999999) selectedColor:nil normalImage:@"icon_assets_select" selectedImage:nil];
    [self.contentView addSubview:_commentBtn];
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_goodBtn.mas_right).offset(8);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 15));
    }];

    _seeBtn = [UIButton qp_textButton:@"125" fontSize:12 normalColor:UIColorFromRGB(0x999999) selectedColor:nil normalImage:@"icon_assets_select" selectedImage:nil];
    [self.contentView addSubview:_seeBtn];
    [_seeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_commentBtn.mas_right).offset(8);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(50, 15));
    }];
    
    _distanceLabel = [UILabel qp_labelWithText:@"12.19km" color:UIColorFromRGB(0x999999) fontSize:12];
    _distanceLabel.numberOfLines = 2;
    [self.contentView addSubview:_distanceLabel];
    [_distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}





@end
