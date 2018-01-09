//
//  RuralTourismViewController.m
//  MyDemo
//
//  Created by home on 2018/1/3.
//  Copyright © 2018年 qingpengwang. All rights reserved.
//
#pragma mark - 农村旅游

#import "RuralTourismViewController.h"
#import "RuralCategoryView.h"
#import "RuralSearchViewController.h"
@interface RuralTourismViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) RuralCategoryView *categoryView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RuralTourismViewController

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
    self.title = @"农村旅游";
    self.view.backgroundColor = [UIColor whiteColor];
    self.categoryView.hidden = NO;
    self.scrollView.hidden = NO;
    
    //NavTtemleft
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backBtn;
    //NavTtemRight
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_icon_search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem = searchItem;
    
}
- (void)search {
    RuralSearchViewController *vc = [[RuralSearchViewController alloc] init];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickTitleScroll:(RuralCategoryView *)sender {
    [self.scrollView setContentOffset:CGPointMake(sender.selectedIndex * self.scrollView.bounds.size.width, 0) animated:YES];
}

#pragma mark - DataSource & Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 只要这三个属性有一个为真,则表示用户正在手动拖拽scrollView
    if (scrollView.isDragging || scrollView.isTracking || scrollView.isDecelerating) {
        CGFloat offsetX = scrollView.contentOffset.x;
        
        self.categoryView.offsetX = offsetX / 2;
    }
    
}

#pragma mark - Getter & Setter
- (RuralCategoryView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[RuralCategoryView alloc] init];
        [self.view addSubview:_categoryView];
        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(SafeAreaTopHeight);
            make.left.right.equalTo(self.view);
            make.height.mas_equalTo(44);
        }];
        [_categoryView addTarget:self action:@selector(clickTitleScroll:) forControlEvents:UIControlEventValueChanged];
    }
    return _categoryView;
}
- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc]init];
        [self.view addSubview:self.scrollView];
        self.scrollView.bounces = NO;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        self.scrollView.backgroundColor = [UIColor whiteColor];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_categoryView.mas_bottom);
            make.left.right.bottom.equalTo(self.view);
        }];
        
        UIView * contentView = [[UIView alloc]init];
        contentView.backgroundColor = [UIColor clearColor];
        [self.scrollView addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_scrollView);
            make.width.mas_equalTo(_scrollView).multipliedBy(2);
            make.height.mas_equalTo(_scrollView);
        }];
        //控制器数组
        NSArray * vcs = @[@"RuralThemeViewController",@"RuralAllViewController"];
        NSInteger index = 0;
        for (NSString * clsName in vcs) {
            Class class = NSClassFromString(clsName);
            
            UIViewController * vc = [[class alloc]init];
            
            [self al_addChildViewController:vc intoView:contentView];
            
            [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(contentView);
                make.width.mas_equalTo(_scrollView);
                make.left.equalTo(_scrollView).offset(AL_SCREEN_WIDTH * index);
            }];
            
            index ++;
        }
        
    }
    return _scrollView;
}
/**
 *  添加子控制器
 *
 *  @param childVc     要添加的子控制器
 *  @param contentView 子控制器view的父控件
 */
- (void)al_addChildViewController:(UIViewController *)childVc intoView:(UIView *)contentView{
    // 添加控制器的view
    [contentView addSubview:childVc.view];
    // 添加子控制器
    [self addChildViewController:childVc];
    // 完成子控制器的添加
    [childVc didMoveToParentViewController:self];
}
@end
