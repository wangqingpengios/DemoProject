//
//  RuralSearchViewController.m
//  MyDemo
//
//  Created by home on 2018/1/4.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//

#import "RuralSearchViewController.h"

@interface RuralSearchViewController ()

@end

@implementation RuralSearchViewController


#pragma mark - View life circle ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Custom Methods
- (void)setupUI {
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}

#pragma mark - Sources & Delegates

#pragma mark - Getter & Setter


@end
