//
//  CSPatientFamousViewController.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/27.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSPatientFamousViewController.h"
#import "CSPatientHealthCell.h"
#import "CSFamousPatientView.h"
#import "CSPatientFamousTool.h"




#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define navBarHeight   60
#define YYMaxSections 100
@interface CSPatientFamousViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) UIPageControl  *pageControl;
@property (nonatomic, strong) NSTimer   *timer;
@property (nonatomic, strong) NSMutableArray  *dataArray;


@end

@implementation CSPatientFamousViewController

static NSString *identifier = @"CSPatientHealthCell";







- (UIPageControl *)pageControl{
    if (!_pageControl) {
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.center = CGPointMake(SCREEN_WIDTH * 0.5, self.view.bounds.size.height - 5);
        self.pageControl.bounds = CGRectMake(0, 0, 150, 40);
        self.pageControl.pageIndicatorTintColor = [UIColor blueColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        self.pageControl.enabled = NO;
        
#pragma mark 网络请求
        self.pageControl.numberOfPages = 5;
        
        
    }
    return _pageControl;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [@[] mutableCopy];
    }
    return _dataArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
   
     self.view.frame = CGRectMake(0,  kScreenHeight / 5 / 5 + marginView, kScreenWidth,  kScreenHeight / 5 -  kScreenHeight / 5 / 5 - marginView);
     [self initView];
    
    [self loadData];
}

- (void)initView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, self.view.bounds.size.height);
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.bounds.size.height) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:collectionView];
    
    
    _collectionView = collectionView;
    
    [self.collectionView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellWithReuseIdentifier:identifier];
    
    
    
    
    
    [self.view addSubview:self.pageControl];
    [self addTimer];

    
    
}


#pragma mark 添加定时器
-(void) addTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextpage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer ;
    
    
}

#pragma mark 删除定时器
-(void) removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void) nextpage{
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    
   // if (self.dataArray.count) {
        NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:YYMaxSections/2];
        [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        NSInteger nextItem = currentIndexPathReset.item +1;
        NSInteger nextSection = currentIndexPathReset.section;
        if (nextItem == 5) {
            nextItem=0;
            nextSection++;
        }
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
        
        [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
   // }
    
    
    
}

#pragma mark- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return YYMaxSections;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    // return self.newses.count;
    //return self.dataArray.count;
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CSPatientHealthCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
   // NSLog(@"名医汇----%@", cell);
//    if(!cell){
//        cell = [[CSCollectionViewCell alloc] init];
//    }
//    cell.doctorModel=self.dataArray[indexPath.item];
    return cell;
}


-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

#pragma mark 当用户停止的时候调用
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
    
}

#pragma mark 设置页码
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
  //  if (self.dataArray.count) {
        int page = (int) (scrollView.contentOffset.x/scrollView.frame.size.width+0.5) % 5;
        
        self.pageControl.currentPage = page;
        
   // }else{
       // self.pageControl.currentPage = 0;
  //  }
    
}

- (void)loadData{
    [CSPatientFamousTool patientFamousToolSuccess:^(NSArray *patientFamousArray) {
        NSLog(@"patientFamousArray%@", patientFamousArray);
    } failture:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
