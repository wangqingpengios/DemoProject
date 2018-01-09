//
//  DemoVC4.m
//  MyDemo
//
//  Created by home on 2017/11/20.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "DemoVC4.h"
#import "NHInFoViewController.h"
#import "RuralTourismViewController.h"
#import "SegmentViewController.h"
#import "VideoPurchaseViewController.h"
#import "AccomViewController.h"
@interface DemoVC4 ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation DemoVC4


#pragma mark - View life circle ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.navigationController pushViewController:[NHInFoViewController new] animated:YES];//农户信息
    [self.navigationController pushViewController:[RuralTourismViewController new] animated:YES];
}

#pragma mark - Custom Methods
- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    self.tableView.hidden = NO;
    
}

#pragma mark - Sources & Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
        {
            [self.navigationController pushViewController:[NHInFoViewController new] animated:YES];
        }
            break;
        case 1:
        {
            [self.navigationController pushViewController:[RuralTourismViewController new] animated:YES];
        }
            break;
        case 2:
        {
            [self.navigationController pushViewController:[SegmentViewController new] animated:YES];
        }
            break;
        case 3:
        {
            [self.navigationController pushViewController:[VideoPurchaseViewController new] animated:YES];
        }
        case 4:
        {
            [self.navigationController pushViewController:[AccomViewController new] animated:YES];
        }
            break;
    }
}
#pragma mark - Getter & Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView initWithFrame:CGRectZero style:UITableViewStylePlain cellSeparatorStyle:UITableViewCellSeparatorStyleSingleLine separatorInset:UIEdgeInsetsMake(0, 0, 0, 0) dataSource:self delegate:self];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
- (NSArray *)dataArray {
    if (!_dataArray) {
        NSArray * arr = @[@"农户信息",@"农村旅游",@"会员随拍",@"测试",@"农村食宿"];
        _dataArray = [NSArray arrayWithArray:arr];
    }
    return _dataArray;
}


@end
