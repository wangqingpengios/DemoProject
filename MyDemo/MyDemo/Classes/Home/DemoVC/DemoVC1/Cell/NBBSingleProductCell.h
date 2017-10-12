//
//  NBBSingleProductCell.h
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NBBSingleContentShowView;

@interface NBBSingleProductCell : UITableViewCell

@property (nonatomic, strong) NBBSingleContentShowView *singleContentShowView;

@property (nonatomic, assign) NSInteger count;

@end
