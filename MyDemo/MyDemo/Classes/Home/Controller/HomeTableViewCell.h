//
//  HomeTableViewCell.h
//  MyDemo
//
//  Created by home on 2017/8/4.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeModel;

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) HomeModel *model;

@end
