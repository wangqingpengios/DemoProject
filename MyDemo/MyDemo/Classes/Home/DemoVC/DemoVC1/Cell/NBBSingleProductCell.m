//
//  NBBSingleProductCell.m
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "NBBSingleProductCell.h"
#import "NBBSingleContentShowView.h"
#import "NBBSingleContentShowViewLayout.h"

@interface NBBSingleProductCell ()

@end

@implementation NBBSingleProductCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
        
    }
    
    return self;
}

- (void)setupUI {
    
    NBBSingleContentShowViewLayout * layout = [[NBBSingleContentShowViewLayout alloc]init];
    self.singleContentShowView = [[NBBSingleContentShowView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.contentView addSubview:self.singleContentShowView];
    [self.singleContentShowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 10, 0, 10));
    }];
}

- (void)setCount:(NSInteger)count {
    _count = count;
    self.singleContentShowView.count = count;
}


@end
