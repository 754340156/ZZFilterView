//
//  ZZFilterHeader.h
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#ifndef ZZFilterHeader_h
#define ZZFilterHeader_h


typedef NS_ENUM(NSInteger, ZZFilterViewType) {
    ZZFilterViewTypeSingle = 0, //单选
    ZZFilterViewTypeMultiple//复选
};


#define kScreenW [UIScreen mainScreen].bounds.size.width


#define cellHeight 30.0f
#define cellMinWidth 60.0f
#define selectedColor  [UIColor whiteColor]
#define normalColor [UIColor grayColor]
#define normalBackGroundColor [UIColor lightGrayColor]
#define selectedBackGroundColor [UIColor orangeColor]
#define isCorner   YES
#define isBorder NO
#define kCellCornerRadius 5.0f
#define kCellBorderWidth 0.6f
#define kCellBorderColor [UIColor orangeColor]
#define kCellFont  [UIFont systemFontOfSize:14] 
#define kHeaderFont [UIFont systemFontOfSize:16]
#define kHeaderColor [UIColor blackColor]


#define kMinimumLineSpacing 10.0f
#define kMinimumInteritemSpacing 10.0f
#define kMaxInteritemSpacing 10.0f
#define kHeaderViewHeight 30.0f
#define kMargin 10.0f
#define kEdgeInset   UIEdgeInsetsMake(kMargin, 50.0f, kMargin, 50.0f)
#import <Masonry/Masonry.h>
#import <MJExtension/MJExtension.h>
#endif /* ZZFilterHeader_h */
