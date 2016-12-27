//
//  ZZFilterModel.h
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZZFilterHeader.h"
@class ZZFilterModel_Model;
@interface ZZFilterModel : NSObject
/**  title */
@property(nonatomic,copy) NSString * title;
/**   */
@property(nonatomic,strong) NSArray <ZZFilterModel_Model *> *filterArray;
/**  SectionHeight */
@property(nonatomic,assign) CGFloat sectionHeight;


@end
@interface ZZFilterModel_Model : NSObject
/**  filter */
@property(nonatomic,copy) NSString * filter;
/**  cellWidth */
@property(nonatomic,assign) CGFloat cellWidth;
/**  是否选中状态 */
@property(nonatomic,assign) BOOL isSelected;
/**  如果是固定宽度，就有值 */
@property(nonatomic,assign) CGFloat  fixedWidth;
@end
