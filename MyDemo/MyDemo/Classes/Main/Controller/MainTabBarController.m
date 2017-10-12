//
//  MainTabBarController.m
//  MyDemo
//
//  Created by home on 2017/7/13.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"

#import "NBBIndicator.h"
#import "DemoVC1.h"


@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewController];
}

#pragma mark - 添加子控制器
- (void)addChildViewController {
    
    NSMutableArray * vcs = [[NSMutableArray alloc]init];
    
    [vcs addObject:[self addChildViewControllerWithClassName:[HomeViewController class] vcTitle:@"Demo" withTabBarItemTitle:@"首页" withTabBarItemImage:@"tabbar_home" withTabBarItemSelectedImage:@"tabbar_home_selected"]];
    
    [vcs addObject:[self addChildViewControllerWithClassName:[UIViewController class] vcTitle:@"大神Demo" withTabBarItemTitle:@"发现" withTabBarItemImage:@"tabbar_discover" withTabBarItemSelectedImage:@"tabbar_discover_selected"]];
    
    [vcs addObject:[self addChildViewControllerWithClassName:[UIViewController class] vcTitle:@"动画Demo" withTabBarItemTitle:@"购物车" withTabBarItemImage:@"tabbar_message_center" withTabBarItemSelectedImage:@"tabbar_message_center_selected"]];
    
    [vcs addObject:[self addChildViewControllerWithClassName:[UIViewController class] vcTitle:@"自己项目Demo" withTabBarItemTitle:@"我" withTabBarItemImage:@"tabbar_profile" withTabBarItemSelectedImage:@"tabbar_profile_selected"]];
    
    self.viewControllers = vcs.copy;

    dispatch_async(dispatch_get_main_queue(), ^{
        NBBIndicator * indicator = [NBBIndicator sharedIndicator];
        indicator.totalCount = 0;
        [self.tabBar addSubview:indicator];
        [self.tabBar bringSubviewToFront:indicator];
    });
}



#pragma mark - 返回控制器的方法
- (UIViewController *)addChildViewControllerWithClassName:(Class)cla vcTitle:(NSString *)vcTitle withTabBarItemTitle:(NSString *)tabBarTitle withTabBarItemImage:(NSString *)tabBarItemImage withTabBarItemSelectedImage:(NSString *)tabBarItemSelectedImage {

    NSAssert([cla isSubclassOfClass:[UIViewController class]], @"cla类型必须要是UIViewController类型，否则就会奔溃！");
    UIViewController * vc = [[cla alloc]init];
    vc.title = vcTitle;
    vc.tabBarItem.title = tabBarTitle;
    vc.tabBarItem.image = [UIImage imageNamed:tabBarItemImage];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:tabBarItemSelectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]} forState:UIControlStateSelected];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    return nav;
}

@end
