//
//  HomeTableViewCell.m
//  MyDemo
//
//  Created by home on 2017/8/4.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeModel.h"

@interface HomeTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;


@end

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        [self setup];
        
    }
    return self;
}

- (void)setup {
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.tintColor = [UIColor blackColor];
    [self.contentView sd_addSubviews:@[self.titleLabel]];

    _titleLabel.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:_titleLabel bottomMargin:10];
    
}
- (void)setModel:(HomeModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
}

@end
