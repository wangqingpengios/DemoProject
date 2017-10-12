//
//  DemoVC1.m
//  MyDemo
//
//  Created by home on 2017/8/10.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "DemoVC1.h"
#import "ContentShowView.h"
#import "NBBHomeHeadSectionView.h"
#import "NBBSingleProductCell.h"
#import "NBBSingleContentShowView.h"
#import "NBBActionControl.h"

static NSString *NBBSingleProductCellID = @"NBBSingleProductCellID";

@interface DemoVC1 ()<UITableViewDelegate,UITableViewDataSource,NBBSingleContentShowViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DemoVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.hidden = NO;
    
    NBBActionControl * actionControl = [NBBActionControl actionControl];
    [actionControl addTarget:self action:@selector(clickActionControl:) forControlEvents:UIControlEventValueChanged];
}


#pragma mark - DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    //test
    NSInteger counts = 6;
    NBBSingleProductCell * cell = [tableView dequeueReusableCellWithIdentifier:NBBSingleProductCellID];
    cell.singleContentShowView.delegates = self;
    cell.count = counts;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NBBHomeHeadSectionView * nbbHomeHeadSectionView  = [[NBBHomeHeadSectionView alloc]init];
    
    return nbbHomeHeadSectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 1000;
}

#pragma mark - NBBSingleContentShowViewDelegate
- (void)nbbSingleContentShowView:(NBBSingleContentShowView *)singleContentShowView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"NBBSingleContentShowView   %zd--%ld",indexPath.section,indexPath.row);
}

#pragma mark - clickActionControl 
- (void)clickActionControl:(UIButton *)button {
    NSLog(@"%ld",(long)button.tag);
}

#pragma mark - Getters & Setters
- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [UITableView initWithFrame:CGRectZero style:UITableViewStyleGrouped cellSeparatorStyle:UITableViewCellSeparatorStyleNone separatorInset:UIEdgeInsetsMake(0, 0, 0, 0) dataSource:self delegate:self];
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [_tableView registerClass:[NBBSingleProductCell class] forCellReuseIdentifier:NBBSingleProductCellID];
    }
    return _tableView;
}



@end
