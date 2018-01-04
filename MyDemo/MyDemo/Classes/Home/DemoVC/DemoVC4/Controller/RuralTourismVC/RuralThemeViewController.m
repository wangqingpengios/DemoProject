//
//  RuralThemeViewController.m
//  MyDemo
//
//  Created by home on 2018/1/3.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//
#pragma mark - 项目主题

#import "RuralThemeViewController.h"
#import "RurakThemeTableViewCell.h"

@interface RuralThemeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation RuralThemeViewController
#pragma mark - View life circle ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.hidden = NO;
}

#pragma mark - Sources & Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RurakThemeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
#pragma mark - Getter & Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView initWithFrame:CGRectZero style:UITableViewStylePlain cellSeparatorStyle:UITableViewCellSeparatorStyleSingleLine separatorInset:UIEdgeInsetsMake(0, 0, 0, 0) dataSource:self delegate:self];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        _tableView.showsVerticalScrollIndicator = NO;
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80)];
        headView.backgroundColor = [UIColor yellowColor];
        _tableView.tableHeaderView = headView;
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 130;
        [_tableView registerClass:[RurakThemeTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
@end
