//
//  SegmentViewController.m
//  commendTest
//
//  Created by Alan on 2017/12/25.
//  Copyright © 2017年 . All rights reserved.
//

#import "SegmentViewController.h"

#import "Additions.h"
#import <Masonry.h>

#define SafeAreaTopHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 88 : 64)

#define SafeAreaBottomHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 34 : 0)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface SegmentViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segmentC;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation SegmentViewController

#pragma mark - 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - setupUI
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.segmentC = [[UISegmentedControl alloc] initWithItems:@[@"会员随拍",@"视频购"]];
    self.navigationItem.titleView = self.segmentC;
    self.segmentC.tintColor = UIColorFromRGB(0x56d176);
    [self.segmentC setWidth:100 forSegmentAtIndex:0];
    [self.segmentC setWidth:100 forSegmentAtIndex:1];
    self.segmentC.selectedSegmentIndex = 0;
    [_segmentC addTarget:self action:@selector(clickSegmentIndex:) forControlEvents:UIControlEventValueChanged];
    self.scrollView.hidden = NO;
}

#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    if (scrollView.isDragging || scrollView.isTracking || scrollView.isDecelerating) {
        CGFloat offsetX = scrollView.contentOffset.x;
        int index = offsetX / w ;
        self.segmentC.selectedSegmentIndex =index;
    }
}
#pragma mark - ClickUISegmentedControlAction
- (void)clickSegmentIndex:(UISegmentedControl *)sender {
    NSInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0:
        case 1:
            [self.scrollView setContentOffset:CGPointMake(sender.selectedSegmentIndex *self.scrollView.bounds.size.width, 0) animated:YES];
            
            break;
            
    }
    
}

#pragma mark - Getter & Setter
- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [self.view addSubview:_scrollView];
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(SafeAreaTopHeight);
            make.left.right.bottom.equalTo(self.view);
        }];
        
        UIView *contentView = [[UIView alloc] init];
        contentView.backgroundColor = [UIColor clearColor];
        [_scrollView addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_scrollView);
            make.width.mas_equalTo(_scrollView).multipliedBy(2);
            make.height.mas_equalTo(_scrollView);
        }];
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        NSArray *vcs = @[@"MembersFilmViewController",@"VideoPurchaseViewController"];
        NSInteger index = 0;
        for (NSString *clsName in vcs) {
            Class class = NSClassFromString(clsName);
            UIViewController *vc = [[class alloc] init];
            [self qp_addChildViewController:vc intoView:contentView];
            [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(_scrollView);
                make.width.mas_equalTo(_scrollView);
                make.left.equalTo(_scrollView).offset(w*index);
            }];
            index++;
        }
    }
    return _scrollView;
}


@end
