//
//  ZZFilterModel.m
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "ZZFilterModel.h"

@implementation ZZFilterModel
- (CGFloat)sectionHeight
{    
    __block CGFloat sectionTotalWidth = 0;
    //计算行数
    __block NSInteger lineCount = 1;
    
    //算出collection的宽
    CGFloat sectionW =  kScreenW - kEdgeInset.left - kEdgeInset.right;
    for (NSInteger i = 0 ; i < self.filterArray.count; i++) {
        ZZFilterModel_Model *model = self.filterArray[i];
        if (sectionTotalWidth + self.filterArray[i].cellWidth + kMinimumInteritemSpacing >= sectionW) {
            sectionTotalWidth = 0;
            lineCount += 1;
        }
        sectionTotalWidth += (model.cellWidth + kMinimumInteritemSpacing);
    }
    return  kMinimumLineSpacing * (lineCount - 1) + lineCount * cellHeight + kEdgeInset.top + kEdgeInset.bottom + kHeaderViewHeight;
}
+ (NSDictionary *)objectClassInArray{
    return @{
             @"filterArray" : @"ZZFilterModel_Model"
             };
}
@end
@implementation ZZFilterModel_Model

- (CGFloat)cellWidth
{
    if (self.fixedWidth) {
        //固定宽度
        return self.fixedWidth;
    }
    CGSize size = [self.filter sizeWithAttributes:@{NSFontAttributeName:kCellFont}];
    CGFloat width = ceilf(size.width);
    if (width + 20 < cellMinWidth) {
        return cellMinWidth;
    }else
    {
        return width + 20;
    }
}

@end
