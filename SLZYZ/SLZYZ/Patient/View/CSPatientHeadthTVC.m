//
//  CSPatientHeadthTVC.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/27.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//  健康咨询下面的tableView

#import "CSPatientHeadthTVC.h"
#import "CSPatientHealthTableViewCell.h"
#import "CSPatientHealthTool.h"

@interface CSPatientHeadthTVC ()

@end

@implementation CSPatientHeadthTVC
 static NSString *identifier = @"CSPatientHealthTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor redColor];
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    
   
    [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CSPatientHealthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  //  NSLog(@"健康咨询-----%@", cell);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.bounds.size.height / 2.5;
}

- (void)loadData{
    [CSPatientHealthTool patientHealthToolSuccess:^(NSArray *patientHealthArray) {
        NSLog(@"patientHealthArray%@", patientHealthArray);
    } failture:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
