//
//  ListViewCell.m
//  MyDemo
//
//  Created by home on 2017/8/31.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "ListViewCell.h"


@implementation ListViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    self.titleLabel = [UILabel qp_labelWithText:@"代码告诉我，我只是个测试版" color:[UIColor blackColor] fontSize:15];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.contentView);
    }];
}

@end
