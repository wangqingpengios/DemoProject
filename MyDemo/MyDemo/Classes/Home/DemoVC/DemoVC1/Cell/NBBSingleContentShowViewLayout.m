//
//  NBBSingleContentShowViewLayout.m
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "NBBSingleContentShowViewLayout.h"

@implementation NBBSingleContentShowViewLayout


- (void)prepareLayout {
    
    [super prepareLayout];
    
    CGSize size = self.collectionView.bounds.size;
    
    //每一行显示3个item
    NSInteger itemNumberForRow = 3;
    
    //计算格子的宽高.
    NSInteger w = (size.width - 10)  / itemNumberForRow;
    
    //设置item的宽高
    self.itemSize = CGSizeMake(w, 175);
    
    //设置最小的格子间距和行间距
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 5;
    
    
    //设置组间距
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
