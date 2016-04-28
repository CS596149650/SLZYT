//
//  CSDoctorHealthView.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/28.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//  医师的健康咨询

#import "CSDoctorHealthView.h"
#import "CSDoctorHealthTVC.h"


@interface CSDoctorHealthView()
@property (nonatomic, strong) UILabel  *topLabel;
@property (nonatomic, strong) UIImageView  *moreImagr;
@property (nonatomic, strong) UIView  *topView;
@property (nonatomic, strong) UIView  *FamousPatientV;

@property (nonatomic, strong) CSDoctorHealthTVC  *doctorTVC;

@end
@implementation CSDoctorHealthView

- (CSDoctorHealthTVC *)doctorTVC{
    if (!_doctorTVC) {
        self.doctorTVC = [[CSDoctorHealthTVC alloc] init];
        
        
    }
    return _doctorTVC;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadSubView];
        [self loadSubViewLoyout];
    }
    return self;
}

- (void)loadSubView{
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = CSColor(255, 255, 255);
    [self addSubview:topView];
    _topView = topView;
    
    UILabel *topLabel = [[UILabel alloc] init];
    topLabel.backgroundColor = [UIColor redColor];
    topLabel.text = @"健康咨询";
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.font = [UIFont boldSystemFontOfSize:20];
    topLabel.adjustsFontSizeToFitWidth = YES;
    [_topView addSubview:topLabel];
    
    _topLabel = topLabel;
    
    UIImageView *moreImage  = [[UIImageView alloc] init];
    moreImage.backgroundColor = [UIColor orangeColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreImgButton:)];
    moreImage.userInteractionEnabled = YES;
    [moreImage addGestureRecognizer:tap];
    [_topView addSubview:moreImage];
    _moreImagr = moreImage;
    
    
    [self addSubview:self.doctorTVC.view];
}
- (void)loadSubViewLoyout{
    _topView.frame = CGRectMake(0, 0, kScreenWidth, self.bounds.size.height / 10);
    _topLabel.frame = CGRectMake(0, 0, kScreenWidth / 4, self.bounds.size.height / 10);
     _moreImagr.frame = CGRectMake(kScreenWidth - marginView - kScreenWidth / 5, 0, kScreenWidth / 5, self.bounds.size.height / 10);
    
  self.doctorTVC.view.frame =  CGRectMake(0, CGRectGetHeight(self.topView.frame) + marginView, kScreenWidth, self.bounds.size.height - self.topLabel.frame.size.height - marginView);
}


- (void)moreImgButton:(UITapGestureRecognizer *)tap{
    // NSLog(@"健康咨询更多%@", self.moreImagr);
     NSLog(@"doctor健康咨询更多");
}

@end
