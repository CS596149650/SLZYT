//
//  CSDoctorHealthTVC.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/28.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSDoctorHealthTVC.h"
#import "CSPatientHealthTableViewCell.h"
@interface CSDoctorHealthTVC ()

@end

@implementation CSDoctorHealthTVC
static NSString *identifier = @"CSPatientHealthTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor redColor];
    
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    
    [self.tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
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
    return self.view.bounds.size.height / 3.5;
}






@end
