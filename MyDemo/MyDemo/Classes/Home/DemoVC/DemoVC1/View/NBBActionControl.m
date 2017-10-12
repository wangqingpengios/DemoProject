//
//  NBBActionControl.m
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#pragma mark -  加减号按钮视图

#import "NBBActionControl.h"
#import "NBBIndicator.h"
@interface NBBActionControl ()

/*! 点菜数量标签  */
@property (nonatomic, strong) UILabel *contentLabel;


@end

@implementation NBBActionControl

+ (instancetype)actionControl {
    
    NBBActionControl * actionControl = [[NBBActionControl alloc] init];
    return actionControl;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
        self.count = 0;
        [self setupUI];
        
    }
    return self;
}



- (void)setupUI {
    
    
    self.backgroundColor = [UIColor qp_colorWithHex:0xf8f8f8];
    
    //减号按钮
    self.minusButton = [UIButton qp_textButton:nil fontSize:0 normalColor:nil selectedColor:nil normalImage:@"" selectedImage:@""];
    self.minusButton.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.minusButton];
    [self.minusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
        make.width.mas_equalTo(33);
    }];
    self.minusButton.tag = -1;

    //加号按钮
    self.plusButton = [UIButton qp_textButton:nil fontSize:0 normalColor:nil selectedColor:nil normalImage:@"" selectedImage:@""];
    self.plusButton.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.plusButton];
    [self.plusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self);
        make.width.mas_equalTo(33);
    }];
    self.plusButton.tag = 1;

    
    //点菜数量
    self.contentLabel = [UILabel qp_labelWithText:@"" color:[UIColor qp_colorWithHex:0x333333] fontSize:13];
    self.contentLabel.numberOfLines = 1;
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
    
    [self.plusButton addTarget:self action:@selector(clickActionControl:) forControlEvents:UIControlEventTouchUpInside];
    [self.minusButton addTarget:self action:@selector(clickActionControl:) forControlEvents:UIControlEventTouchUpInside];

}
#pragma mark - 加减号按钮点击事件
- (void)clickActionControl:(UIButton *)button {
    
    self.count += button.tag;
    self.isIncrease = button.tag == 1;
    // 发送数量值改变事件
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setCount:(NSInteger)count {
    _count = count;
    _contentLabel.hidden =  count <= 0;
    _minusButton.hidden = count <= 0;
    _plusButton.hidden = count <= 0;
    self.hidden = count <= 0;
    // 设置点菜数量
    _contentLabel.text = @(count).description;
    
    NBBIndicator *indicator = [NBBIndicator sharedIndicator];
    indicator.totalCount  = @(count);
    
    
    
}



@end
