//
//  NSArray+Additions.m
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "NSArray+Additions.h"
#import "NSObject+Additions.h"

@implementation NSArray (Additions)


+ (NSArray *)qp_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName {

    NSURL *url = [[NSBundle mainBundle] URLForResource:plistName withExtension:nil];
    NSArray *list = [NSArray arrayWithContentsOfURL:url];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    Class cls = NSClassFromString(clsName);
    NSAssert(cls, @"加载 plist 文件时指定的 clsName - %@ 错误", clsName);
    
    for (NSDictionary *dict in list) {
        [arrayM addObject:[cls qp_objectWithDict:dict]];
    }
    
    return arrayM.copy;
}
@end
