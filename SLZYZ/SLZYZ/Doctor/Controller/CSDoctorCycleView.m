//
//  CSDoctorCycleView.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/28.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//  医师轮播图界面

#import "CSDoctorCycleView.h"
#import "SDCycleScrollView.h"


@interface CSDoctorCycleView () <SDCycleScrollViewDelegate>

@end
@implementation CSDoctorCycleView

- (void)viewDidLoad{
    self.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight / 4);
    self.view.backgroundColor = [UIColor redColor];
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height ) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    [self.view addSubview:cycleScrollView];
    
   // [self loadData];
    
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    
}

#pragma mark - 网络请求
//- (void)loadData{
//    
//    [CSPatientLuoBoTool patientWithSuccess:^(NSArray *patientLunboArray) {
//        NSLog(@"patientLunbo%@", patientLunboArray);
//    } failture:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
//    
//}
@end
