//
//  NBBSingleContentShowViewCell.m
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "NBBSingleContentShowViewCell.h"
#import "NBBActionControl.h"
#import "NBBIndicator.h"

@interface NBBSingleContentShowViewCell ()

/*! 图片  */
@property (nonatomic, strong) UIImageView *iconImageView;

/*! 商品名称 */
@property (nonatomic, strong) UILabel *foodNameLabel;

/*! 商品折扣价格  */
@property (nonatomic, strong) UILabel *discountLabel;

/*! 商品价格  */
@property (nonatomic, strong) UILabel *priceLabel;

/*! 菜篮按钮  */
@property (nonatomic, strong) UIButton *addShoppingCarBtn;


@end

@implementation NBBSingleContentShowViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];

    }
    
    return self;
}

- (void)setupUI {
    
    //配置圆角和边框
    self.layer.cornerRadius = 1.5;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor qp_colorWithHex:0xf8f8f8].CGColor;
    
    self.iconImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.iconImageView];
    self.iconImageView.backgroundColor = [UIColor cyanColor];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(80);
    }];
    
    self.foodNameLabel = [UILabel qp_labelWithText:@"秋刀鱼的滋味" color:[UIColor qp_colorWithHex:0x333333] fontSize:13];
    self.foodNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.foodNameLabel];
    [self.foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(5);
    }];
    
    self.discountLabel = [UILabel qp_labelWithText:@"¥586.90" color:[UIColor qp_colorWithHex:0x999999] fontSize:10];
    self.discountLabel.textAlignment = NSTextAlignmentLeft;
    NSDictionary *attrDict = @{
                               NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle | NSUnderlinePatternSolid),
                               NSStrikethroughColorAttributeName:[UIColor qp_colorWithHex:0x999999]
                               };
    self.discountLabel.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥586.90"] attributes:attrDict];
    [self.contentView addSubview:self.discountLabel];
    [self.discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leadingMargin.equalTo(self.foodNameLabel);
        make.top.equalTo(self.foodNameLabel.mas_bottom).offset(6);
    }];
    
    
    self.priceLabel = [UILabel qp_labelWithText:@"¥499.90" color:[UIColor qp_colorWithHex:0xff6c00] fontSize:13];
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leadingMargin.equalTo(self.discountLabel);
        make.top.equalTo(self.discountLabel.mas_bottom).offset(5);
    }];
    
    self.addShoppingCarBtn = [UIButton qp_textButton:nil fontSize:0 normalColor:[UIColor blackColor] selectedColor:nil normalImage:@"" selectedImage:@""];
    self.addShoppingCarBtn.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.addShoppingCarBtn];
    [self.addShoppingCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(22);
    }];
    [self.addShoppingCarBtn addTarget:self action:@selector(addShoppingCar:) forControlEvents:UIControlEventTouchUpInside];
    self.addShoppingCarBtn.hidden = NO;
 
    NBBActionControl * actionControl = [[NBBActionControl alloc]init];
    [self.contentView addSubview:actionControl];
    self.actionControl = actionControl;
    [actionControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(22);
    }];
    [self.actionControl addTarget:self action:@selector(countValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    // 使用KVO监听actionControl count属性值的变化
    [self.actionControl addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma countValueChanged 
#pragma mark - 监听点菜数量的改变
- (void)countValueChanged:(NBBActionControl *) actionControl {
    // 记录数量
    //外界传入的菜篮数量 = actionControl.count;
    //    NSLog(@"%@ %zd",self.food.name,self.food.orderCount);
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    if (actionControl.isIncrease) { // 点击加号
//        userInfo[@"button"] = actionControl.plusButton;
    }
//    userInfo[@"food"] = //外界模型;
    // 发通知
//    [[NSNotificationCenter defaultCenter] postNotificationName: object:nil userInfo:userInfo];
}

#pragma mark - KVO回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    self.actionControl.hidden = self.actionControl.count == 0;
    self.addShoppingCarBtn.hidden = !self.actionControl.hidden;
}

#pragma mark - 添加到购物车按钮点击事件
- (void)addShoppingCar:(UIButton *)btn {
    self.actionControl.count ++;
    
}

- (void)dealloc {
    // 移除KVO监听
    [self.actionControl removeObserver:self forKeyPath:@"count"];
}

@end
