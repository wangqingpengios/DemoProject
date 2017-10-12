//
//  FilterView.m
//  modal
//
//  Created by jinhuadiqigan on 2017/8/29.
//  Copyright © 2017年 jinhuadiqigan. All rights reserved.
//

#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

#import "FilterView.h"

#import <BAButton.h>

@interface FilterView ()

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) NSMutableArray *buttons;


@end

@implementation FilterView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
     
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI {
    
    

    NSInteger counts = 4;
    
    CGFloat buttonW = 80;
    CGFloat buttonH = 40;
    
    if (counts == 1) {
        buttonW = kWindowW;
    }
    else if  (counts == 2) {
        buttonW = kWindowW /2;
    }
    else if (counts == 3) {
        buttonW = kWindowW / 3;
    }
    
    else if (counts == 4) {
        buttonW = kWindowW / 4;
    }
    else {
        buttonW = 80;
    }
    
    for (int i = 0; i < counts; ++i) {
        
        self.btn = [UIButton ba_buttonWithFrame:CGRectMake(buttonW * i, 0, buttonW, buttonH) title:@"哈哈" titleColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:15] image:[UIImage imageNamed:@"search_new_search"] backgroundColor:[UIColor whiteColor]];
        self.btn.ba_buttonLayoutType = BAKit_ButtonLayoutTypeCenterImageRight;
        [self.btn setBa_padding:7];
        [self addSubview:self.btn];
        [self.btn ba_buttonSetTitleColor:[UIColor blackColor] selectedTitleColor:[UIColor greenColor] highlightedTitleColor:nil disabledTitleColor:nil];
        [self.btn ba_buttonAddTarget:self tag:i action:@selector(clickBtn:)];
        if (i == 3) {
            
            [self.btn setImage:[UIImage imageNamed:@"select_new"] forState:UIControlStateNormal];
        }
        else {
            
            [self.btn setImage:[UIImage imageNamed:@"search_new_search"] forState:UIControlStateNormal];
        }
        
        [self.buttons addObject:self.btn];
    }
    
    UIView *lineView = [[UIView alloc] init];
    [self addSubview:lineView];
    lineView.backgroundColor = [UIColor grayColor];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    lineView.alpha = 0.5;
    
    
}

- (void)clickBtn:(UIButton *)btn {
        
    if (self.clickBtnBlock) {
        
        self.clickBtnBlock(btn.tag);
    }
    
//    [btn setImage:[UIImage imageNamed:@"select_new"] forState:UIControlStateNormal];
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    
    NSInteger index = 0;
    
    for (UIButton *btn in self.buttons) {
        
        [btn setTitle:dataArray[index] forState:UIControlStateNormal];
     
        index++;
    }
    
}


- (void)setBtnCount:(NSInteger)btnCount {
    
    _btnCount = btnCount;
    
}

- (NSMutableArray *)buttons {
    
    if (!_buttons) {
        
        _buttons = @[].mutableCopy;
        
    }
    
    return _buttons;
}





@end
