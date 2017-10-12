//
//  DemoVCMager.h
//  MyDemo
//
//  Created by home on 2017/9/1.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "BaseNetManger.h"

@interface DemoVCMager : BaseNetManger

+ (void)getDemoVCInfoCompleHandle:(void(^)(id responseObject,NSError *error))completed;

@end
