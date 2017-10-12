//
//  NBBIndicator.h
//  MyDemo
//
//  Created by home on 2017/9/4.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBBIndicator : UILabel

@property (nonatomic, assign) NSNumber * totalCount;

+ (instancetype)sharedIndicator;

@end
