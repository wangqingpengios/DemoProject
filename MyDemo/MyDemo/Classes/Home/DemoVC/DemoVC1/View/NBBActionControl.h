//
//  NBBActionControl.h
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBBActionControl : UIControl

+ (instancetype)actionControl;


/*! 加号按钮  */
@property (nonatomic, strong) UIButton *plusButton;

/*! 减号按钮  */
@property (nonatomic, strong) UIButton *minusButton;

/**
 *  记录当前点菜数量
 */
@property (nonatomic, assign) NSInteger count;
/**
 *  YES:添加 NO:减少数量
 */
@property (nonatomic, assign) BOOL isIncrease;
@end
