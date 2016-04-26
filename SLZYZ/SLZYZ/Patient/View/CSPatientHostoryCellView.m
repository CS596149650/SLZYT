//
//  CSPatientHostoryCellView.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/26.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSPatientHostoryCellView.h"


@interface CSPatientHostoryCellView()
@property (nonatomic, strong) UILabel  *firstlabel;
@property (nonatomic, strong) UILabel  *secondLabel;
@property (nonatomic, strong) UIImageView  *imagView;

@end
@implementation CSPatientHostoryCellView




- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadSubView];
        [self loadSubViewLayOut];
    }
    return self;
}
- (void)loadSubView{
    UILabel *firstLabal = [[UILabel alloc] init];
    firstLabal.backgroundColor = [UIColor orangeColor];
    //设置字体:粗体，正常的是 SystemFontOfSize
    firstLabal.font = [UIFont boldSystemFontOfSize:20];
    //设置文字位置
    firstLabal.textAlignment = NSTextAlignmentCenter;
    //设置字体大小适应label宽度
    firstLabal.adjustsFontSizeToFitWidth = YES;
    [self addSubview:firstLabal];
    _firstlabel = firstLabal;
    
    UILabel *secondLabal = [[UILabel alloc] init];
    secondLabal.backgroundColor = [UIColor yellowColor];
    secondLabal.font = [UIFont systemFontOfSize:14];
    secondLabal.textAlignment = NSTextAlignmentCenter;
    secondLabal.adjustsFontSizeToFitWidth = YES;
    [self addSubview:secondLabal];
    _secondLabel = secondLabal;
    
    UIImageView *imagView = [[UIImageView alloc] init];
    imagView.backgroundColor = [UIColor orangeColor];
    [self addSubview:imagView];
    _imagView = imagView;
    
}
- (void)loadSubViewLayOut{

    long width = self.bounds.size.width / 3 * 2;
    long height = self.bounds.size.height / 2;
    _firstlabel.frame = CGRectMake(0, 0, width, height );
    _secondLabel.frame = CGRectMake(0, height , width, height);

    long imgWidth = self.bounds.size.width / 3 - 8;
    
    _imagView.frame = CGRectMake(CGRectGetMaxX(self.firstlabel.frame) + 4, (self.bounds.size.height - imgWidth) / 2, imgWidth, imgWidth);
    _imagView.layer.masksToBounds = YES;
    _imagView.layer.cornerRadius = self.imagView.bounds.size.width / 2;

}
- (void)loadtitlefirst:(NSString *)first second:(NSString *)second three:(NSString *)three{
    self.firstlabel.text = first;
    self.secondLabel.text = second;

    //self.imagView.
}
@end
