//
//  NHInFoViewController.m
//  MyDemo
//
//  Created by home on 2018/1/2.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//

#pragma mark - 农户信息

#import "NHInFoViewController.h"
#import "SSSearchBar.h"
#import "HNInFoHeadView.h"
#import "NHLeftTableViewCell.h"
#import "NHRightTableViewCell.h"
static NSString *leftCellID = @"leftCellID";
static NSString *rightCellID = @"rightCellID";

@interface NHInFoViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) HNInFoHeadView *headView;
@property (nonatomic, strong) SSSearchBar *searchBar;
@property (nonatomic, strong) UITableView *leftSectionTableView;
@property (nonatomic, strong) UITableView *rightDetailTableView;
@end

@implementation NHInFoViewController

#pragma mark - View life circle ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - Custom Methods
- (void)setupUI {
    
    self.title = @"农户信息";
    
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
    
    //NavTtemleft
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    //NavTtemRight
    UIBarButtonItem *iconItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(clickIcon)];
    UIBarButtonItem *volume = [[UIBarButtonItem alloc] initWithTitle:@"领券" style:UIBarButtonItemStylePlain target:self action:@selector(clickIcon)];
    [volume setTintColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItems = @[iconItem,volume];
    
    
    [self.view addSubview:self.headView];
    self.headView.backgroundColor = [UIColor whiteColor];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(SafeAreaTopHeight);
        make.height.mas_equalTo(87);
    }];
    
    [self.view addSubview:self.searchBar];
    self.searchBar.placeholder = @"请输入关键字搜索";
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
    
    self.leftSectionTableView.hidden = NO;
    
    self.rightDetailTableView.hidden = NO;
    
    //默认选择第一组第一行
    [self.leftSectionTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}
#pragma mark - NavBarAction
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)clickIcon {
    
}


#pragma mark - DataSource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return tableView == _leftSectionTableView ? 1:5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableView == _leftSectionTableView ? 5:2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (tableView == _leftSectionTableView) {
        NHLeftTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:leftCellID forIndexPath:indexPath];
        NSArray * arr = @[@"蔬菜水果",@"粗粮",@"肉类",@"地方特产",@"其他"];
        cell.textLabel.text = arr[indexPath.row];
        return cell;
    }
    else {
        NHRightTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:rightCellID forIndexPath:indexPath];
        cell.clickShopBtn = ^(UITableViewCell *nhRightCell, NSInteger tag) {
            NSIndexPath *indexpath = [tableView indexPathForCell:nhRightCell];
            NSLog(@"点击了第%zd组-第%zd行加入购物车",indexpath.section,indexpath.row);
        };
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _leftSectionTableView) {
        return 40;
    }
    else {
        return 85;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == _leftSectionTableView) {
        UIView * headView = [[UIView alloc]init];
        return headView;
    }
    else {
        UIView * headView = [[UIView alloc]init];
        headView.backgroundColor = UIColorFromRGB(0xf8f8f8);
        UILabel * headTitleLabel = [[UILabel alloc]init];
        [headView addSubview:headTitleLabel];
        NSArray * arr = @[@"蔬菜水果",@"粗粮",@"肉类",@"地方特产",@"其他"];
        headTitleLabel.text = arr[section];
        headTitleLabel.font = [UIFont systemFontOfSize:12];
        headTitleLabel.textColor = [UIColor blackColor];
        [headTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headView).offset(10);
            make.centerY.equalTo(headView);
        }];
        return headView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == _rightDetailTableView) {
        return 34;
    }
    else  {
        return 0.01f;
    }
}
#pragma mark - Getter & Setter
- (HNInFoHeadView *)headView {
    if (!_headView) {
        _headView = [[HNInFoHeadView alloc] init];
    }
    return _headView;
}

- (SSSearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[SSSearchBar alloc] init];
        _searchBar.delegate = self;
    }
    return _searchBar;
}
- (UITableView *)leftSectionTableView {
    if (!_leftSectionTableView) {
        _leftSectionTableView = [UITableView initWithFrame:CGRectZero style:UITableViewStylePlain cellSeparatorStyle:UITableViewCellSeparatorStyleNone separatorInset:UIEdgeInsetsMake(0, 0, 0, 0) dataSource:self delegate:self];
        [self.view addSubview:_leftSectionTableView];
        [_leftSectionTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_searchBar.mas_bottom).offset(5);
            make.left.bottom.equalTo(self.view);
            make.width.mas_equalTo(100);
        }];
        [_leftSectionTableView registerClass:[NHLeftTableViewCell class] forCellReuseIdentifier:leftCellID];
    }
    return _leftSectionTableView;
}
- (UITableView *)rightDetailTableView {
    if (!_rightDetailTableView) {
        _rightDetailTableView = [UITableView initWithFrame:CGRectZero style:UITableViewStylePlain cellSeparatorStyle:UITableViewCellSeparatorStyleSingleLine separatorInset:UIEdgeInsetsMake(0, 0, 0, 0) dataSource:self delegate:self];
        [self.view addSubview:_rightDetailTableView];
        [_rightDetailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_leftSectionTableView.mas_right);
            make.top.equalTo(_searchBar.mas_bottom).offset(5);
            make.right.bottom.equalTo(self.view);
        }];
        [_rightDetailTableView registerClass:[NHRightTableViewCell class] forCellReuseIdentifier:rightCellID];

    }
    return _rightDetailTableView;
}

@end
