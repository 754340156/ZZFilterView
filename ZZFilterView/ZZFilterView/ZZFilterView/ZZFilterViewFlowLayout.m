
//
//  ZZFilterViewFlowLayout.m
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/12.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "ZZFilterViewFlowLayout.h"
#import "ZZFilterHeader.h"

@implementation ZZFilterViewFlowLayout
//处理最大间距问题
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for(int i = 1; i < [attributes count]; ++i) {
        //当前attributes
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        //上一个attributes
        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
        NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
        if (prevLayoutAttributes.frame.origin.y == currentLayoutAttributes.frame.origin.y) {
            if (currentLayoutAttributes.frame.origin.x - origin > kMaxInteritemSpacing) {
                CGRect frame =  currentLayoutAttributes.frame;
                frame.origin.x = origin + kMaxInteritemSpacing;
                currentLayoutAttributes.frame = frame;
            }
        }
    }
    return attributes;
}
@end
