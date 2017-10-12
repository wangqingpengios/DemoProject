//
//  HomeViewController.m
//  MyDemo
//
//  Created by home on 2017/7/14.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import "HomeView.h"

static NSString * cellID = @"cellID";

@interface HomeViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) HomeView *homeView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupUI];
    
}

#pragma mark - 设置界面
- (void)setupUI {
    
    
    self.homeView.hidden = NO;
    
    _homeView.selectBlock = ^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray, NSInteger index) {
        NSLog(@"%zd",index);
    };
    
}

#pragma mark - getters & setters
- (HomeView *)homeView {
    
    if (!_homeView) {
        
//        _homeView = [[HomeView alloc] initWithFrame:self.view.frame withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
//        }];
        
        _homeView = [[HomeView alloc] initWithFrame:self.view.bounds withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray, NSInteger index) {
            
            
            
        }];
        
        
        
        
        
        [self.view addSubview:_homeView];
        
    }

    return _homeView;
}

@end
