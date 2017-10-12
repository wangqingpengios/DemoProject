//
//  NBBSingleContentShowView.m
//  MyDemo
//
//  Created by home on 2017/8/26.
//  Copyright © 2017年 qingpengwang. All rights reserved.
//

#import "NBBSingleContentShowView.h"
#import "NBBSingleContentShowViewCell.h"

static NSString * NBBSingleContentShowViewCellID = @"NBBSingleContentShowViewCellID";
@interface NBBSingleContentShowView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation NBBSingleContentShowView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 配置属性
- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self registerClass:[NBBSingleContentShowViewCell class] forCellWithReuseIdentifier:NBBSingleContentShowViewCellID];
    
    self.dataSource = self;
    self.delegate = self;
    }

#pragma mark - DataSource & Delegate 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NBBSingleContentShowViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NBBSingleContentShowViewCellID forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegates respondsToSelector:@selector(nbbSingleContentShowView:didSelectItemAtIndexPath:)]) {
        [self.delegates nbbSingleContentShowView:self didSelectItemAtIndexPath:indexPath];
    }
}

@end
