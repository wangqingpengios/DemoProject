//
//  NHLeftTableViewCell.m
//  MyDemo
//
//  Created by home on 2018/1/2.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//

#import "NHLeftTableViewCell.h"

@implementation NHLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.font = [UIFont systemFontOfSize:13];
        self.textLabel.textAlignment = 1;
        self.textLabel.numberOfLines = 1;
        self.textLabel.highlightedTextColor = UIColorFromRGB(0x56d176);
        
        
        UIView *selectedView = [[UIView alloc] init];
        selectedView.backgroundColor = [UIColor whiteColor];
        self.selectedBackgroundView = selectedView;
        self.backgroundColor = UIColorFromRGB(0xf8f8f8);
        
        UIView *greenView = [[UIView alloc]init];
        greenView.backgroundColor = UIColorFromRGB(0x56d176) ;
        [selectedView addSubview:greenView];
        [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.left.equalTo(selectedView);
            make.size.mas_equalTo(CGSizeMake(3, 40));
        }];
    }
    return self;
}


@end
