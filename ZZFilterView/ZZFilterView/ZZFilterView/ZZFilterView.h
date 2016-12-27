//
//  ZZFilterView.h
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZFilterModel.h"



@interface ZZFilterView : UIView
/**
 *  初始化（自动设置按钮的最小宽度，按钮之间的最小最大间距，如果你的宽度是固定的，那么最小和最大是相等的）
 *
 *  @param frame  <#****#>
 *  @param dataArray <#****#>
 *  @param isBounces 是否能滚动
 *  @param heightCallBack 把总的高度返回
 *  @param width 如果是固定宽度一定要传
 */
- (instancetype)initWithFrame:(CGRect)frame DataArray:(NSArray *)dataArray IsBounces:(BOOL)isBounces HeightCallBack:(void(^)(CGFloat height))heightCallBack Width:(CGFloat )width;
/**  单选or复选 */
@property(nonatomic,assign) ZZFilterViewType  type;
/**  选中的block */
@property(nonatomic,copy) void (^selectedBlock)(NSArray *array);
@end
