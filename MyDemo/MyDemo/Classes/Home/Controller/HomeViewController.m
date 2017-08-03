//
//  HomeViewController.m
//  MyDemo
//
//  Created by home on 2017/7/14.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "HomeViewController.h"

static NSString * cellID = @"cellID";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

#pragma mark - 设置界面
- (void)setupUI {
    
    self.tableView.hidden = NO;
    
}

#pragma mark - DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    
        cell.textLabel.text =  [NSString stringWithFormat:@"%zd-%zd",indexPath.section,indexPath.row];
        
    
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 48) style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.tableFooterView = [UIView new];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    }
    return _tableView;
}



@end
