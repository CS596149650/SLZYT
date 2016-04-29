//
//  CSPatientFamousTool.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/29.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSPatientFamousTool.h"
#import "CSPatientFamousModel.h"
#import "CSHttpTool.h"
#import "MJExtension.h"
#import "CSPatientCacheTool.h"

@implementation CSPatientFamousTool
+ (void)patientFamousToolSuccess:(void (^)(NSArray * patientFamousArray))Success failture:(void (^)(NSError *error))failture{
    
    NSArray *patientFamousSql = [CSPatientCacheTool PatientFamousModelParam];
    if (patientFamousSql.count) {
        if (Success) {
            Success(patientFamousSql);
        }
        return;
    }
    
    [CSHttpTool POST:famous parameters:nil success:^(id responseObject) {
        NSLog(@"CSPatientFamousTool%@", responseObject);
        if (responseObject) {
            NSArray *patientFamousArr = [CSPatientFamousModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            Success(patientFamousArr);
        }
        [CSPatientCacheTool saveWithPatientFamousModel:responseObject[@"data"]];
        
    } failure:^(NSError *error) {
        NSLog(@"CSPatientFamousTool %@", error);
    }];
    
}
@end
