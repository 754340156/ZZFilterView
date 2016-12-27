//
//  ZZFilterHeaderView.m
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "ZZFilterHeaderView.h"
#import "ZZFilterModel.h"
@interface ZZFilterHeaderView ()
/**  title */
@property(nonatomic,strong) UILabel * titleLabel;
@end

@implementation ZZFilterHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self setLayout];
    }
    return self;
}
#pragma mark - setup
- (void)setup
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = kHeaderFont;
    [self.titleLabel sizeToFit];
    [self addSubview:self.titleLabel];
    self.titleLabel.textColor = kHeaderColor;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kMargin);
        make.centerY.offset(0);
    }];
}
- (void)setLayout
{
    
}
#pragma mark - custom method

#pragma mark - handle action

#pragma mark - setter model
- (void)setModel:(ZZFilterModel *)model
{
    _model = model;
    self.titleLabel.text = model.title;
    
}
@end
