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
        
    }
    return self;
}


@end
