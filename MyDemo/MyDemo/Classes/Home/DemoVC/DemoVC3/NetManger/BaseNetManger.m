//
//  BaseNetManger.m
//  MyDemo
//
//  Created by home on 2017/9/1.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "BaseNetManger.h"

static AFHTTPSessionManager *manager = nil;
@implementation BaseNetManger

+ (AFHTTPSessionManager *)defaultManager {
    
    static dispatch_once_t onceTonken;
    
    dispatch_once(& onceTonken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/json",@"text/plain",@"text/javascript",@"application/json", nil];
    });
    return manager;
    
}

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void (^)(id, NSError *))completed {
    
    return [[self defaultManager] GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"GET Error: %@",error.userInfo);
    }];
    
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params complationHandle:(void(^)(id responseObject, NSError *error))completed {
    return [[self defaultManager] POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completed(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"POST Error:%@",error.userInfo);
    }];
}

@end
