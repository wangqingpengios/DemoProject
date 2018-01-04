//
//  NHRightTableViewCell.h
//  MyDemo
//
//  Created by home on 2018/1/2.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHRightTableViewCell : UITableViewCell
@property (nonatomic, copy) void (^clickShopBtn)(UITableViewCell *nhRightCell,NSInteger tag);
@end
