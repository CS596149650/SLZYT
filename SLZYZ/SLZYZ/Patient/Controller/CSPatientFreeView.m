//
//  CSPatientFreeView.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/26.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//  第二个模块 免费问医

#import "CSPatientFreeView.h"
#import "CSPatientFreeCellView.h"
#import "CSPatientHostoryCellView.h"


@interface CSPatientFreeView ()


@property (nonatomic, strong) CSPatientFreeCellView  *FreeAskDoctor;
@property (nonatomic, strong) CSPatientHostoryCellView  *HositoryAskDoctor;
@property (nonatomic, strong) CSPatientHostoryCellView  *OrderDoctor;

@end
@implementation CSPatientFreeView



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.FreeAskDoctor];
        [self addSubview:self.HositoryAskDoctor];
        [self addSubview:self.OrderDoctor];
        [self loadTitle];
    }
    return self;
}
- (void)loadTitle{
    [self.FreeAskDoctor loadtitlefirst:@"免费问医" second:@"在线找权威的医师" three:@"疑难杂症 快速帮你解答" four:@"随时随地 医生就在您的身边" five:nil];
    [self.HositoryAskDoctor loadtitlefirst:@"历史记录" second:@"病情诊断记录" three:nil];
    [self.OrderDoctor loadtitlefirst:@"订单" second:@"在线付款" three:nil];
}

- (CSPatientFreeCellView *)FreeAskDoctor{
    if (!_FreeAskDoctor) {
        self.FreeAskDoctor = [[CSPatientFreeCellView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth / 2 - marginView / 2 , self.bounds.size.height)];
        self.FreeAskDoctor.backgroundColor = [UIColor redColor];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(freeAskDoctorAction:)];
        [self.FreeAskDoctor addGestureRecognizer:tapGesture];
    }
    return _FreeAskDoctor;
}

- (CSPatientHostoryCellView *)HositoryAskDoctor{
    if (!_HositoryAskDoctor) {
        self.HositoryAskDoctor = [[CSPatientHostoryCellView alloc] initWithFrame:CGRectMake(kScreenWidth / 2+ marginView / 2, 0,  kScreenWidth / 2 - marginView / 2 , self.bounds.size.height / 2 - marginView / 2)];
        self.HositoryAskDoctor.backgroundColor = [UIColor grayColor];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hositoryAskDoctorAction:)];
        [self.HositoryAskDoctor addGestureRecognizer:tapGesture];
    }
    return _HositoryAskDoctor;
}
- (UIView *)OrderDoctor{
    if (!_OrderDoctor) {
        self.OrderDoctor = [[CSPatientHostoryCellView alloc] initWithFrame:CGRectMake(kScreenWidth / 2+ marginView / 2, self.bounds.size.height / 2 + marginView / 2, kScreenWidth / 2 - marginView / 2 ,  self.bounds.size.height / 2 - marginView / 2)];
        self.OrderDoctor.backgroundColor = [UIColor greenColor];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OrderDoctorAction:)];
        [self.OrderDoctor addGestureRecognizer:tapGesture];
    }
    return _OrderDoctor;
}


- (void)freeAskDoctorAction:(UITapGestureRecognizer *)tap{
   // NSLog(@"freeAskDoctorAction");
}
- (void)hositoryAskDoctorAction:(UITapGestureRecognizer *)tap{
   // NSLog(@"hositoryAskDoctorAction");
}

- (void)OrderDoctorAction:(UITapGestureRecognizer *)tap{
   // NSLog(@"OrderDoctorAction");
}
@end
