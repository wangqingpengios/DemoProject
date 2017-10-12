//
//  NSObject+Additions.h
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Additions)


/// 字典转模型，使用字典创建对象。

//  @param  dict 字典

//  @return 模型对象

+ (instancetype)qp_objectWithDict:(NSDictionary *)dict;

@end
