//
//  CSPatientHeathView.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/26.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSPatientHeathView.h"
#import "CSPatientHeadthTVC.h"



@interface CSPatientHeathView ()
@property (nonatomic, strong) UILabel  *topLabel;
@property (nonatomic, strong) UIImageView  *moreImagr;
@property (nonatomic, strong) UIView  *topView;
@property (nonatomic, strong) UIView  *FamousPatientV;

@property (nonatomic, strong) CSPatientHeadthTVC  *patientTVC;



@end
@implementation CSPatientHeathView

- (CSPatientHeadthTVC *)patientTVC{
    if (!_patientTVC) {
        self.patientTVC = [[CSPatientHeadthTVC alloc] init];
      

    }
    return _patientTVC;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadSubView];
        [self loadSubViewLoyout];
    }
    return  self;
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
    
    
    
    [self addSubview:self.patientTVC.view];

    
}
- (void)loadSubViewLoyout{
    _topView.frame = CGRectMake(0, 0, kScreenWidth, self.bounds.size.height / 8);
    _topLabel.frame = CGRectMake(0, 0, kScreenWidth / 4, self.bounds.size.height / 8);
   _moreImagr.frame = CGRectMake(kScreenWidth - marginView - kScreenWidth / 5, 0, kScreenWidth / 5, self.bounds.size.height / 5);

      self.patientTVC.view.frame =  CGRectMake(0, CGRectGetHeight(self.topLabel.frame) + marginView, kScreenWidth, self.bounds.size.height - self.topLabel.frame.size.height - marginView);
}


- (void)moreImgButton:(UITapGestureRecognizer *)tap{
    NSLog(@"健康咨询更多%@", self.moreImagr);
    NSLog(@"健康咨询更多");
}
@end
