//
//  DemoVCModel.m
//  MyDemo
//
//  Created by home on 2017/9/6.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "DemoVCModel.h"

@implementation DemoVCModel


@end


@implementation Entrances

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    
    return @{

             @"list" : [EntrancesList class]
             
             };
}
@end

@implementation EntrancesList

@end

@implementation DiscoveryC

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    
    return @{
             
             @"list" : [DiscoveryC_List class]
             
             };
}
@end

@implementation DiscoveryC_List

@end

@implementation Editor

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    
    return @{
             
             @"list" : [EditorRecomm_List class]
             
             };
    
}




@end

@implementation EditorRecomm_List


@end

@implementation HotRe

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    
    return @{
             
             @"list" : [HotRe_List class]
             
             };
}

@end

@implementation HotRe_List


+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    
    return @{
             
             @"list" : [HotRe_ArrayList class]
             
             };
}

@end

@implementation HotRe_ArrayList



@end
