//
//  CSMiddleViewController.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/28.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSMiddleViewController.h"

@interface CSMiddleViewController ()

@end

@implementation CSMiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
     self.view.frame =CGRectMake(0, kScreenHeight / 4 + margin, kScreenWidth, kScreenHeight / 5);
    [self loadSubview];
}

- (void)loadSubview{
    long height = self.view.bounds.size.height;
    long width =  (self.view.bounds.size.width - marginView * 4) / 3;
    long buttonY = 0;

    for (int i = 0; i < 3; i++) {
        float buttonX = (width + marginView) * i + marginView;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      
        button.frame = CGRectMake(buttonX, buttonY, width, height);
        [button addTarget:self action:@selector(handleBtton:) forControlEvents:UIControlEventTouchUpInside];
        
        float imageMarginTop = 10;
        float imageMarginLeft = 15;
        float imageH = button.bounds.size.height / 5  * 3.5 - imageMarginTop;
        float imageW = button.bounds.size.width - imageMarginLeft * 2;
        
        UIImageView *imageview;
        if (imageH < imageW) {
            UIImageView *imagview=[[UIImageView alloc]initWithFrame:CGRectMake((button.bounds.size.width - imageH) / 2, imageMarginTop, imageH, imageH)];
       
            imageview = imagview;
            
        }
        else{
              UIImageView *imagview=[[UIImageView alloc]initWithFrame:CGRectMake((button.bounds.size.width - imageW ) / 2, imageMarginTop, imageW, imageW)];
             imageview = imagview;
        }
        
        NSLog(@"imageview------%@", imageview);
      //  UIImage *imag = [UIImage imageNamed:[NSString stringWithFormat:@"%@", imageArray[i]]];
        //UIImage *imag = [UIImage imageNamed:@"yisheng-gn"];
        
        
      //  imagview.image=imag;
        [imageview setContentMode:UIViewContentModeScaleAspectFit];
        
        
        
        //创建文本标签
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake((button.bounds.size.width - imageH) / 2, CGRectGetMaxY(imageview.frame) + marginView,imageview.bounds.size.width,  button.bounds.size.height  - CGRectGetMaxY(imageview.frame) - marginView)];
        [lable setTextAlignment:NSTextAlignmentCenter];
        [lable setFont:[UIFont systemFontOfSize:15.0]];
        
        button.tag = 200 + i;
        
        [button addSubview:imageview];
        [button addSubview:lable];
        button.backgroundColor = [UIColor blueColor];
        imageview.backgroundColor = [UIColor blackColor];
        lable.backgroundColor = [UIColor orangeColor];
        
        [self.view addSubview:button];
    }
}

- (void)handleBtton:(UIButton *)btn{
    NSLog(@"doctor 第几个按钮 %d", btn.tag);
}
@end
