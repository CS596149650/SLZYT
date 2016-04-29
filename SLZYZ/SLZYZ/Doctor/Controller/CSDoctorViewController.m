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
        self.doctorCycleView = [[CSDoctorCycleView alloc] init];
       
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
    
    [self addChildViewController:self.doctorCycleView];
    [self.view addSubview:self.doctorCycleView.view];
    
    [self addChildViewController:self.doctorMiddleView];
    [self.view addSubview:self.doctorMiddleView.view];
    
    [self.view addSubview:self.doctorHealthView];
    
    
    
}



@end
