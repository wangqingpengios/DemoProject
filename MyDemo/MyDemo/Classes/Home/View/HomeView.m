//
//  HomeView.m
//  MyDemo
//
//  Created by home on 2017/8/9.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "HomeView.h"
#import "HomeModel.h"
#import "DemoVC1.h"
#import "HomeTableViewCell.h"

static NSString * cellID = @"HomeViewCellID";

@interface HomeView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) NSMutableArray *classNameArray;

@property (nonatomic, strong) NSMutableArray *dataModelArray;

@property (nonatomic, strong) NSIndexPath *DidindexPath;
@end

@implementation HomeView

#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock {
    
    if (self = [super initWithFrame:frame]) {
        
        self.selectBlock = selectRowBlock;
        
        self.tableView.hidden = NO;
        
        [self addLoadData];
        
        [self modelDate];
        
        if (self.selectBlock) {
            self.selectBlock(_tableView, _DidindexPath, self.dataModelArray, self.dataModelArray.count);
        }
        
    }
    
    return self;
}

- (void)addLoadData {
    
    [self cellAddtitle:@"DemoVC1--tableView嵌套collectionView" Class:@"DemoVC1"];
    [self cellAddtitle:@"DemoVC2-下拉菜单-bug版" Class:@"DemoVC2"];
    [self cellAddtitle:@"DemoVC3-YYModel使用全解" Class:@"DemoVC3"];
    [self cellAddtitle:@"我是Demo4" Class:@"DemoVC4"];
    [self cellAddtitle:@"我是Demo5" Class:@"DemoVC5"];
    [self cellAddtitle:@"我是Demo6" Class:@"DemoVC6"];
    [self cellAddtitle:@"我是Demo7" Class:@"DemoVC7"];
    [self cellAddtitle:@"我是Demo8" Class:@"DemoVC8"];
    [self cellAddtitle:@"我是Demo9" Class:@"DemoVC9"];
    [self cellAddtitle:@"我是Demo10" Class:@"DemoVC10"];
    [self cellAddtitle:@"我是Demo11" Class:@"DemoVC11"];
    [self cellAddtitle:@"我是Demo12" Class:@"DemoVC12"];
    [self cellAddtitle:@"我是Demo13" Class:@"DemoVC13"];
    [self cellAddtitle:@"我是Demo14" Class:@"DemoVC14"];
    [self cellAddtitle:@"我是Demo15" Class:@"DemoVC15"];
    [self cellAddtitle:@"我是Demo16" Class:@"DemoVC16"];
    [self cellAddtitle:@"我是Demo17" Class:@"DemoVC17"];
    [self cellAddtitle:@"我是Demo18" Class:@"DemoVC18"];
    [self cellAddtitle:@"我是Demo19" Class:@"DemoVC19"];
    [self cellAddtitle:@"我是Demo20" Class:@"DemoVC20"];
    
}

- (void)cellAddtitle:(NSString *)title Class:(NSString *) claName{
    
    [self.titleArray addObject:title];
    [self.classNameArray addObject:claName];
    
}

- (void)modelDate {
    
    for (int i = 0; i < self.titleArray.count; ++i) {
        
        HomeModel * model = [[HomeModel alloc] init];
        model.title = self.titleArray[i];
        model.titleClass = self.classNameArray[i];
        
        [self.dataModelArray addObject:model];
        
    }
    
}


#pragma mark - DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeModel * model = self.dataModelArray[indexPath.row];
    
    HomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.title = model.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//     UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    NSIndexPath *index = [self.tableView indexPathForCell:cell];
    
    _DidindexPath = indexPath;
        
    NSString * className = self.classNameArray[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *vc = [[class alloc] init];
        vc.title = self.titleArray[indexPath.row];
        vc.hidesBottomBarWhenPushed = YES;
        [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
    
    }
    
    
}

#pragma mark - getters & setters
- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self addSubview:_tableView];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        
        [_tableView setBackgroundColor:[UIColor clearColor]];
        UIImageView *backgroundView = [[UIImageView alloc] init];
        backgroundView.image = [UIImage imageNamed:@"樱花树3.jpg"];
        backgroundView.contentMode = UIViewContentModeScaleAspectFill;
        backgroundView.frame = _tableView.bounds;
        _tableView.backgroundView = backgroundView;
        _tableView.separatorColor = [UIColor cyanColor];
        [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:cellID];
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return _tableView;
}

- (NSMutableArray *)titleArray {
    
    if (!_titleArray) {
        
        _titleArray = @[].mutableCopy;
    }
    
    return _titleArray;
}

- (NSMutableArray *)classNameArray {
    
    if (!_classNameArray) {
        
        _classNameArray = @[].mutableCopy;
    }
    
    return _classNameArray;
}
- (NSMutableArray *)dataModelArray {

    if (!_dataModelArray) {
        _dataModelArray = @[].mutableCopy;
    }
    return _dataModelArray;
}


@end
