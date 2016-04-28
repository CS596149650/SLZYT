//
//  CSDoctorViewController.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/26.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSDoctorViewController.h"
#import "CSDoctorCycleView.h"
#import "SDCycleScrollView.h"
#import "CSMiddleViewController.h"
#import "CSDoctorHealthView.h"

@interface CSDoctorViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) CSDoctorCycleView *doctorCycleView;
@property (nonatomic, strong)  CSMiddleViewController*doctorMiddleView;
@property (nonatomic, strong) CSDoctorHealthView  *doctorHealthView;
@end

@implementation CSDoctorViewController


- (CSDoctorCycleView *)doctorCycleView{
    if (!_doctorCycleView) {
        self.doctorCycleView = [[CSDoctorCycleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight / 4)];
        self.doctorCycleView.backgroundColor = [UIColor redColor];
    }
    return _doctorCycleView;
}

- (CSMiddleViewController *)doctorMiddleView{
    if (!_doctorMiddleView) {
        self.doctorMiddleView = [[CSMiddleViewController alloc] init];
       
  
        
    }
    return _doctorMiddleView;
}


- (CSDoctorHealthView *)doctorHealthView{
    if (!_doctorHealthView) {
        self.doctorHealthView = [[CSDoctorHealthView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.doctorMiddleView.view.frame) + margin, kScreenWidth, kScreenHeight - CGRectGetMaxY(self.doctorMiddleView.view.frame) + margin )];
       
    }
    return _doctorHealthView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CSColor(246, 245, 244);
    
    [self.view addSubview:self.doctorCycleView];
    [self addChildViewController:self.doctorMiddleView];
    [self.view addSubview:self.doctorMiddleView.view];
    [self.view addSubview:self.doctorHealthView];
    
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.doctorCycleView.bounds.size.width, self.doctorCycleView.bounds.size.height) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    [self.doctorCycleView addSubview:cycleScrollView];
    
    
}

#pragma mark--轮播效果
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"--doctor点击了第%ld张图片", index);
}

@end
