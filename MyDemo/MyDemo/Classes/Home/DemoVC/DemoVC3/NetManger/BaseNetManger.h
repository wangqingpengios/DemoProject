//
//  BaseNetManger.h
//  MyDemo
//
//  Created by home on 2017/9/1.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManger : NSObject

/**  对AFN进行简单的GET请求方法进行封装 */
+ (id)GET:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void(^)(id responseObject, NSError *error))completed;

/**  对AFN进行简单的POST请求方法进行封装 */
+ (id)POST:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void(^)(id responseObject, NSError *error))completed;
@end
