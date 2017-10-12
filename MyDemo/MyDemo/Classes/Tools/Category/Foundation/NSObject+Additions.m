//
//  NSObject+Additions.m
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "NSObject+Additions.h"

@implementation NSObject (Additions)

+ (instancetype)qp_objectWithDict:(NSDictionary *)dict {

    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}
@end
