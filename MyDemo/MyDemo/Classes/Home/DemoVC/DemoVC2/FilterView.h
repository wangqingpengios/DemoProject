//
//  FilterView.h
//  modal
//
//  Created by jinhuadiqigan on 2017/8/29.
//  Copyright © 2017年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickButton)(NSInteger index);

@interface FilterView : UIView

@property (nonatomic, copy) ClickButton clickBtnBlock;


@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) NSInteger btnCount;

@end
