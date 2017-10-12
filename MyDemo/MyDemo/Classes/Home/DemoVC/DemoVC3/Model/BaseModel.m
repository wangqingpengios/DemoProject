//
//  BaseModel.m
//  MyDemo
//
//  Created by home on 2017/9/6.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {

    return @{@"ID":@"id"};
}

@end
