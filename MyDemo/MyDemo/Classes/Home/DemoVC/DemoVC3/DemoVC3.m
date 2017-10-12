//
//  DemoVC3.m
//  MyDemo
//
//  Created by home on 2017/8/29.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "DemoVC3.h"

#import "DemoVCMager.h"

#import "DemoVCModel.h"


@interface DemoVC3 ()

@end

@implementation DemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self loadData];
}

- (void)loadData {
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [DemoVCMager getDemoVCInfoCompleHandle:^(id responseObject, NSError *error) {
        
        DemoVCModel * model = [DemoVCModel yy_modelWithJSON:responseObject];
        
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width, 40)];
        [self.view addSubview:label];
        label.numberOfLines = 0;
        label.textColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        
        label.text = model.hotRecommends.list[0].list[0].tags;
        
    }];
    
}



@end
