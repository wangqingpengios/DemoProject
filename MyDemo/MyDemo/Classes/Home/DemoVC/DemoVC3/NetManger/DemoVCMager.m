//
//  DemoVCMager.m
//  MyDemo
//
//  Created by home on 2017/9/1.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "DemoVCMager.h"


//@"http://mobile.ximalaya.com/mobile/discovery/v1/recommends?channel=and-d3&device=android&includeActivity=true&includeSpecial=true&scale=2&version=4.3.26.2"

// ?号前网址
#define kHomeURLPath @"http://mobile.ximalaya.com/mobile/discovery/v1/recommends"
#define kCategoryURLPath @"http://mobile.ximalaya.com/mobile/discovery/v1/categories"
#define kNickURLPath @"http://mobile.ximalaya.com/m/explore_user_index"
#define kRankURLPath @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group"
#define kLiveURLPath @"http://live.ximalaya.com/live-web/v1/getHomePageRadiosList"

#define kURLVersion @"version":@"4.3.26.2"
#define kURLDevice @"device":@"ios"
#define kURLSpecial @"includeSpecial":@"true"
#define kURLActivity @"includeActivity":@"true"
#define kURLScale @"scale":@2
#define kURLPage @"page":@1
#define kURLPicVersion @"picVersion":@11
#define KURLChannel @"channel":@"and-f5"   // 会变 貌似不影响

@implementation DemoVCMager
+ (void)getDemoVCInfoCompleHandle:(void(^)(id responseObject,NSError *error))completed {
    
    [self GET:kHomeURLPath parameters:@{KURLChannel,kURLDevice,kURLActivity,kURLSpecial,kURLScale,kURLVersion} complationHandle:^(id responseObject, NSError *error) {
        
        completed(responseObject,nil);
    }];
}
@end
