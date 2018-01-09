//
//  NewPlayViewController.m
//  MyDemo
//
//  Created by home on 2018/1/9.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//

#import "NewPlayViewController.h"
#import "WMPlayer.h"

@interface NewPlayViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation NewPlayViewController


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
    self.title = @"MWPlayer";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.hidden = NO;
}

#pragma mark - Sources & Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 9;
}

#pragma mark - Getter & Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView initWithFrame:CGRectZero style:UITableViewStyleGrouped cellSeparatorStyle:UITableViewCellSeparatorStyleNone separatorInset:UIEdgeInsetsZero dataSource:self delegate:self];
        [self.view addSubview:_tableView];
        [_tableView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 9;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 400;
        
    }
    return _tableView;
}
@end
