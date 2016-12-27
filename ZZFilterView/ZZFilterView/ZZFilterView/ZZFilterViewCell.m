//
//  ZZFilterViewCell.m
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "ZZFilterViewCell.h"

@interface ZZFilterViewCell ()
/**  uibutton */
@property(nonatomic,strong) UIButton * button;

@end


@implementation ZZFilterViewCell

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
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setTitleColor:normalColor forState:UIControlStateNormal];
    [self.button setTitleColor:selectedColor forState:UIControlStateSelected];
    [self.button setBackgroundImage:[self imageWithColor:normalBackGroundColor] forState:UIControlStateNormal];
    [self.button setBackgroundImage:[self imageWithColor:selectedBackGroundColor] forState:UIControlStateSelected];
    if (isCorner) {
        self.button.layer.cornerRadius =  kCellCornerRadius;
        self.button.layer.masksToBounds = YES;
    }
    if (isBorder) {
        self.button.layer.borderColor = kCellBorderColor.CGColor;
        self.button.layer.borderWidth = kCellBorderWidth;
    }
    self.button.titleLabel.font = kCellFont ;
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.button];
}
- (void)setLayout
{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}
#pragma mark - custom method
- (UIImage *)imageWithColor:(UIColor *)color
{
    if (color == nil) {
        return nil;
    }
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1 ,1);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark - handle action
- (void)buttonAction:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZZFilterViewCellDelegate_clickWithCell:)]) {
        [self.delegate ZZFilterViewCellDelegate_clickWithCell:self];
    }
}
    
#pragma mark - setter model
- (void)setModel:(ZZFilterModel_Model *)model
{
    _model = model;
    [self.button setTitle:model.filter forState:UIControlStateNormal];
    self.button.selected = model.isSelected;
}

@end
