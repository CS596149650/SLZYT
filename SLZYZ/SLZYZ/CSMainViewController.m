//
//  CSMainViewController.m
//  SYZYF
//
//  Created by 1780933497@qq.com on 3/4/16.
//  Copyright © 2016 MrCHEN. All rights reserved.
//

#import "CSMainViewController.h"
#import "SlideNavigationController.h"






@interface CSMainViewController () <SlideNavigationControllerDelegate>
@property (nonatomic, strong) UISegmentedControl *segmentVC;
@property (nonatomic, strong) UIButton  *leftButton;
@end

@implementation CSMainViewController
- (void)viewDidLoad{
    
    
    
    
    self.view.backgroundColor=[UIColor yellowColor];
    UIButton *leftbutton  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    leftbutton.backgroundColor = [UIColor redColor];
    leftbutton.clipsToBounds = YES;
    leftbutton.layer.cornerRadius = 35.0/2;

    [leftbutton addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    _leftButton = leftbutton;
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    [SlideNavigationController sharedInstance].leftBarButtonItem = leftBarButtonItem;
    UIButton * btnRight = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnRight.frame = CGRectMake(0, 0, 30, 30);
   // btnRight.backgroundColor = [UIColor yellowColor];
    [btnRight setImage:[UIImage imageNamed:@"tonggao1"] forState:UIControlStateNormal];
 
    /*
    [btnRight addTarget:self action:@selector(btnRight) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barRight = [[UIBarButtonItem alloc]initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem = barRight;
   */
    
    self.segmentVC = [[UISegmentedControl alloc] initWithItems:nil];
    [self.segmentVC insertSegmentWithTitle:@"医师" atIndex:0 animated:YES];
    [self.segmentVC insertSegmentWithTitle:@"患者" atIndex:1 animated:YES];


    [self.segmentVC addTarget:self action:@selector(controlPressed:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:self.segmentVC];
    
    
    
}

/*
 *点击segmentControl TabBarController发生变化
 */
- (void)controlPressed:(UISegmentedControl *)sender{
  
    if (sender.selectedSegmentIndex) {

        
    }
    else{

        
    }
}


/**
 *    设置左边能够侧滑
 */

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

/**
 * 隐藏导航栏
 */

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  
    
  
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
 

    
    
}




@end
