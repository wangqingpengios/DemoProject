//
//  NBBSingleContentShowView.h
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NBBSingleContentShowView;

@protocol NBBSingleContentShowViewDelegate <NSObject>

- (void)nbbSingleContentShowView:(NBBSingleContentShowView *)singleContentShowView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface NBBSingleContentShowView : UICollectionView

@property (nonatomic, weak) id<NBBSingleContentShowViewDelegate> delegates;

@property (nonatomic, assign) NSInteger count;

@end
