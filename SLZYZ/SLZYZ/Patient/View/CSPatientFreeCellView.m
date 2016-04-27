//
//  CSPatientFreeCellView.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/26.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSPatientFreeCellView.h"


@interface CSPatientFreeCellView ()
@property (nonatomic, strong) UILabel  *firstLabel;
@property (nonatomic, strong) UILabel  *secondLabel;
@property (nonatomic, strong) UILabel  *threeLabel;
@property (nonatomic, strong) UILabel  *fourLabel;
@property (nonatomic, strong) UIImageView  *imagView;

@end
@implementation CSPatientFreeCellView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadSubview];
        [self loadSubViewLoyout];
    }
    return self;
}

- (void)loadSubview{
    UILabel *firstLabel = [[UILabel alloc] init];
    firstLabel.backgroundColor = [UIColor orangeColor];
    //设置字体:粗体，正常的是 SystemFontOfSize
    firstLabel.font = [UIFont boldSystemFontOfSize:20];
    //设置文字位置
    firstLabel.textAlignment = NSTextAlignmentCenter;
   //设置字体大小适应label宽度
    firstLabel.adjustsFontSizeToFitWidth = YES;
    _firstLabel = firstLabel;
    [self addSubview:firstLabel];
    
    UILabel *secondeLabel = [[UILabel alloc] init];
    secondeLabel.backgroundColor = [UIColor yellowColor];
    //设置字体:粗体，正常的是 SystemFontOfSize
    
    secondeLabel.font = [UIFont systemFontOfSize:12];
    //设置字体大小适应label宽度
    secondeLabel.adjustsFontSizeToFitWidth = YES;
    _secondLabel = secondeLabel;
    //设置文字位置
    secondeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:secondeLabel];
    
    UILabel *threeLabel = [[UILabel alloc] init];
    threeLabel.backgroundColor = [UIColor orangeColor];
    //设置文字位置
    threeLabel.textAlignment = NSTextAlignmentCenter;
    threeLabel.font = [UIFont systemFontOfSize:10];
    //设置字体大小适应label宽度
    threeLabel.adjustsFontSizeToFitWidth = YES;
    _threeLabel = threeLabel;
        [self addSubview:threeLabel];
    
    UILabel *fourLabel = [[UILabel alloc] init];
    fourLabel.backgroundColor = [UIColor yellowColor];
    //设置文字位置
    fourLabel.textAlignment = NSTextAlignmentCenter;
    fourLabel.font = [UIFont systemFontOfSize:10];
    //设置字体大小适应label宽度
    fourLabel.adjustsFontSizeToFitWidth = YES;
    _fourLabel = fourLabel;
        [self addSubview:fourLabel];
    
    UIImageView *imagV = [[UIImageView alloc] init];
    imagV.backgroundColor = [UIColor orangeColor];
  
    _imagView = imagV;
    [self addSubview:imagV];
    
}

- (void)loadSubViewLoyout{
    long viewY = self.bounds.size.height / 10;
    long width = self.bounds.size.width / 3 * 2;
    long height = self.bounds.size.height / 5;
    _firstLabel.frame = CGRectMake(0, 0, width, height + viewY);
    _secondLabel.frame = CGRectMake(0, self.bounds.size.height / 5  + viewY, width, height);
    _threeLabel.frame = CGRectMake(0,  self.bounds.size.height / 5 * 2 + viewY, width, height);
    _fourLabel.frame = CGRectMake(0,  self.bounds.size.height / 5 * 3 + viewY , width, height);
    
    long imgWidth = self.bounds.size.width / 3 - 8;
    
    _imagView.frame = CGRectMake(CGRectGetMaxX(self.firstLabel.frame) + 4, (self.bounds.size.height - imgWidth) / 2, imgWidth, imgWidth);
    _imagView.layer.masksToBounds = YES;
    _imagView.layer.cornerRadius = self.imagView.bounds.size.width / 2;
    
    NSLog(@"%@", self.imagView);
}

- (void)loadtitlefirst:(NSString *)first second:(NSString *)second three:(NSString *)three four:(NSString *)four five:(NSString *)five{
    self.firstLabel.text = first;
    self.secondLabel.text = second;
    self.threeLabel.text = three;
    self.fourLabel.text = four;
    self.imagView.image = [UIImage imageNamed:@"new_feature_1"];
    //self.imagView.
}
@end
