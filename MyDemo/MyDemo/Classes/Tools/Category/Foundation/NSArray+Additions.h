//
//  NSArray+Additions.h
//  MyDemo
//
//  Created by home on 2017/8/25.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Additions)

/**
 *  e.g:
 *     NSArray * arr = [NSArray ns_objectListWithPlistName:@"xxx.plist"clsName:@"xxxxModel"];
 *
 */


/// 从 plist 文件创建指定 clsName 对象数组
/// @param plistName plist 文件名
/// @param clsName   要创建模型的类名
/// @return clsName 的对象数组

+ (NSArray *)qp_objectListWithPlistName:(NSString *)plistName clsName:(NSString *)clsName;

@end
