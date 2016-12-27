//
//  ViewController.m
//  ZZFilterView
//
//  Created by zhaozhe on 16/12/9.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "ViewController.h"
#import "ZZFilterView.h"


@interface ViewController ()
/**  ZZFilterView */
@property(nonatomic,strong) ZZFilterView * filterView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@{@"title":@"尺寸选择",
                         @"filterArray":@[@{@"filter":@"S"},
                                          @{@"filter":@"M"},
                                          @{@"filter":@"L"},
                                          @{@"filter":@"S"},
                                          @{@"filter":@"M"},
                                          @{@"filter":@"L"},
                                          @{@"filter":@"S"},
                                          @{@"filter":@"M"},
                                          @{@"filter":@"L"}]},
                       @{@"title":@"颜色分类",
                         @"filterArray":@[@{@"filter":@"白色白色白色"},
                                          @{@"filter":@"黄色"},
                                          @{@"filter":@"灰色白色"},
                                          @{@"filter":@"白色白色"},
                                          @{@"filter":@"黄色"},
                                          @{@"filter":@"灰色"},
                                          @{@"filter":@"白色白色"},
                                          @{@"filter":@"黄色白色"},
                                          @{@"filter":@"灰色"}]}];
    
    self.filterView = [[ZZFilterView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300) DataArray:[ZZFilterModel mj_objectArrayWithKeyValuesArray:array] IsBounces:NO HeightCallBack:^(CGFloat height) {
        NSLog(@"%f",height);
    } Width:90];
    self.filterView.type = ZZFilterViewTypeMultiple;
    self.filterView.selectedBlock = ^(NSArray *array)
    {
        
    };
    [self.view addSubview:self.filterView];
}




@end
