//
//  ZZFilterView.m
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "ZZFilterView.h"

#import "ZZFilterViewCell.h"
#import "ZZFilterHeaderView.h"
#import "ZZFilterViewFlowLayout.h"
@interface ZZFilterView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ZZFilterViewCellDelegate>
/**  collectionView */
@property(nonatomic,strong) UICollectionView * collectionView;
/**  保存model数组 */
@property(nonatomic,strong) NSMutableArray <ZZFilterModel *>* dataArray;
@end

@implementation ZZFilterView

- (instancetype)initWithFrame:(CGRect)frame DataArray:(NSArray *)dataArray IsBounces:(BOOL)isBounces HeightCallBack:(void(^)(CGFloat height))heightCallBack Width:(CGFloat )width
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = dataArray.mutableCopy;
        
        if (width) {
         //固定宽度
            for (NSInteger i = 0; i < self.dataArray.count; i++) {
                for (NSInteger j = 0; j < self.dataArray[i].filterArray.count; j++) {
                    ZZFilterModel_Model *model = self.dataArray[i].filterArray[j];
                    model.fixedWidth = width;
                }
            }
        }
        [self setupIsBounces:isBounces HeightCallBack:heightCallBack];
        [self setLayout];
    }
    return self;
}
#pragma mark - setup
- (void)setupIsBounces:(BOOL)isBounces HeightCallBack:(void(^)(CGFloat height))heightCallBack
{
    ZZFilterViewFlowLayout *flowLayout = [[ZZFilterViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
    [self.collectionView registerClass:[ZZFilterViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ZZFilterViewCell class])];
    [self.collectionView registerClass:[ZZFilterHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ZZFilterHeaderView class])];
    
    
    if (!isBounces) {
        
        self.collectionView.bounces = NO;
        __block CGFloat totalHeight = 0;
        [self.dataArray enumerateObjectsUsingBlock:^(ZZFilterModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            totalHeight +=  obj.sectionHeight;
        }];
        if (heightCallBack) {
            heightCallBack(totalHeight);
        }
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, totalHeight);
        [self layoutIfNeeded];
        self.collectionView.frame = self.bounds;
        [self.collectionView layoutIfNeeded];
    }
    
}
- (void)setLayout
{
    
}
#pragma mark - custom method
- (void)setSelectedWithDataArray:(NSArray <ZZFilterModel *>*)array IndexPath:(NSIndexPath *)indexPath Type:(ZZFilterViewType)type
{
    [array[indexPath.section].filterArray enumerateObjectsUsingBlock:^(ZZFilterModel_Model * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (type == ZZFilterViewTypeSingle) {
            //单选
            obj.isSelected = NO;
            if (idx == indexPath.row) {
                obj.isSelected = YES;
            }
        }else if (type == ZZFilterViewTypeMultiple)
        {
            //复选
            if (idx == indexPath.row) {
                obj.isSelected = !obj.isSelected;
            }
            
        }

    }];
}
#pragma mark - handle action

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray[section].filterArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZZFilterViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ZZFilterViewCell class]) forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.section].filterArray[indexPath.row];
    cell.delegate = self;
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ZZFilterHeaderView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ZZFilterHeaderView class]) forIndexPath:indexPath];
        headerView.model = self.dataArray[indexPath.section];
        return headerView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.dataArray[indexPath.section].filterArray[indexPath.row].cellWidth, cellHeight);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kMinimumLineSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kMinimumInteritemSpacing;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, kHeaderViewHeight);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return  kEdgeInset;
}
#pragma mark - ZZFilterViewCellDelegate
- (void)ZZFilterViewCellDelegate_clickWithCell:(ZZFilterViewCell *)cell
{
    if (!self.type) {
        self.type = ZZFilterViewTypeSingle;
    }
    
    NSIndexPath * indexPath = [self.collectionView indexPathForCell:cell];
    [self setSelectedWithDataArray:self.dataArray IndexPath:indexPath Type:self.type];
    [self.collectionView reloadData];
    if (self.selectedBlock) {
        self.selectedBlock(self.dataArray);
    }
}
#pragma mark - setter model
#pragma mark - lazy
- (NSMutableArray<ZZFilterModel *> *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
