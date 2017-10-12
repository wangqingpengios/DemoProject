//
//  NBBSingleContentShowViewCell.h
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NBBActionControl;

@interface NBBSingleContentShowViewCell : UICollectionViewCell

@property (nonatomic, weak) NBBActionControl *actionControl;

@property (nonatomic, getter=isClickaddShoppingCarBtn) BOOL isClick;

@end
