//
//  DemoVC2.m
//  MyDemo
//
//  Created by home on 2017/8/28.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "DemoVC2.h"
#import "FilterView.h"
#import "ListView.h"
#import "RightController.h"

/*! weakSelf */
#define QP_WEAKSELF typeof(self) __weak weakSelf = self
#define QP_WeakSelf(type)  __weak typeof(type) weak##type = type;

/*! strongSelf */
#define QP_StrongSelf(type)  __strong typeof(type) type = weak##type

@interface DemoVC2 ()

@property (nonatomic, strong) FilterView *filterView;

@property (nonatomic, strong) ListView *listView;
@end

@implementation DemoVC2

#pragma mark - View life circle ViewController 生命周期方法

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUI];
    
    
}

#pragma mark - Custom Methods 自定义方法
- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *dataArray = @[@"分类",@"地区",@"排序",@"筛选"];
    self.filterView = [[FilterView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44)];
    [self.view addSubview:self.filterView];
    self.filterView.dataArray = dataArray;
    
    QP_WEAKSELF;
    _filterView.clickBtnBlock = ^(NSInteger index) {
        
        if (index == 3) {
            [weakSelf.listView setHidden:YES];
            
            [weakSelf showRightView:YES];
            
            return ;
        }
        
        else if ([weakSelf.listView isHidden ] == YES && index != 3) {
            
            [weakSelf.listView setHidden:NO];
            
            [UIView animateWithDuration:0.5 animations:^{
                [weakSelf.listView setFrame:CGRectMake(0, weakSelf.view.y+104, weakSelf.view.width, weakSelf.view.height)];
            } completion:^(BOOL finished) {
                
            }];
            
        }
        else {
            
            if ([weakSelf.listView isHidden] == NO && index == 3) {
                
                [UIView animateWithDuration:0.5 animations:^{
                    
                    [weakSelf.listView setFrame:CGRectMake(0, self.view.frame.origin.y-weakSelf.view.frame.size.height, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height+100)];
                    
                } completion:^(BOOL finished) {
                    
                    [weakSelf.listView setHidden:YES];
                }];
            }
            
        }
        if (index == 0) {
            [weakSelf.listView.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(300);
            }];
        }
        else if (index == 1) {
        
            [weakSelf.listView.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(150);
            }];
        }
        else if (index == 2) {
            
            [weakSelf.listView.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(130);
            }];
        }
    };
    
    
    _listView = [[ListView alloc] initWithFrame:CGRectMake(0, 108, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view addSubview:self.listView];
    [_listView setHidden:YES];
    
    _listView.clickListView = ^(NSInteger index) {
        
        if ([weakSelf.listView isHidden] == YES) {
            [weakSelf.listView setHidden:NO];
            [UIView animateWithDuration:0.5 animations:^{
                [weakSelf.listView setFrame:CGRectMake(0, weakSelf.view.y+104, weakSelf.view.width, weakSelf.view.height)];
            } completion:^(BOOL finished) {
                
            }];
        }
        else {

            [UIView animateWithDuration:0.5 animations:^{
                
                [weakSelf.listView setFrame:CGRectMake(0, self.view.frame.origin.y-weakSelf.view.frame.size.height, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height+100)];
                
            } completion:^(BOOL finished) {
                
                [weakSelf.listView setHidden:YES];
            }];
        }
        
        
    };

}
#pragma mark - 视图从右到左
- (void)showRightView:(BOOL)show {
    
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    
//    if (![window.subviews containsObject:[RightController new].view]) {
//        [window addSubview:[RightController new].view];
//    }
    
}

#pragma mark - Sources & Delegates 代理、协议方法


#pragma mark - getters & setter
@end
