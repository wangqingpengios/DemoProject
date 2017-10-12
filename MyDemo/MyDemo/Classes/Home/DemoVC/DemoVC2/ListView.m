//
//  ListView.m
//  MyDemo
//
//  Created by home on 2017/8/30.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "ListView.h"
#import "ListViewCell.h"

static NSString * cellID = @"cellID";

@interface ListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIButton *coverBtn;



@end

@implementation ListView


- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
     
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)setupUI {
    
    _coverBtn.hidden = NO;
    
    _coverBtn = [[UIButton alloc] init];
    _coverBtn.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [self addSubview:_coverBtn];
    _coverBtn.backgroundColor = [UIColor blackColor];
    [_coverBtn addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _coverBtn.alpha = 0.2f;
    _coverBtn.tag = 10001;
    
    _tableView = [UITableView initWithFrame:self.bounds style:UITableViewStylePlain cellSeparatorStyle:0 separatorInset:UIEdgeInsetsMake(10, 0, 0, 10) dataSource:self delegate:self];
    [_coverBtn addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.coverBtn);
        make.height.mas_equalTo(200);
    }];
    [_tableView registerClass:[ListViewCell class] forCellReuseIdentifier:cellID];
    
    _tableView.showsVerticalScrollIndicator = NO;
    
}

#pragma mark - DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell.titleLabel.text = @(indexPath.row).description;
    }
    
    return cell;
}

- (void)coverBtnClick:(UIButton *)btn {

    if (self.clickListView) {
        
        self.clickListView(btn.tag);
    }
}

@end
