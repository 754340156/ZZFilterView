//
//  ZZFilterViewCell.h
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZZFilterModel.h"
@class ZZFilterModel_Model,ZZFilterViewCell;

@protocol ZZFilterViewCellDelegate <NSObject>
/**  */
- (void)ZZFilterViewCellDelegate_clickWithCell:(ZZFilterViewCell *)cell;

@end

@interface ZZFilterViewCell : UICollectionViewCell

/**  代理*/
@property (nonatomic,weak) id <ZZFilterViewCellDelegate> delegate;
/**  model */
@property(nonatomic,strong) ZZFilterModel_Model * model;
@end
