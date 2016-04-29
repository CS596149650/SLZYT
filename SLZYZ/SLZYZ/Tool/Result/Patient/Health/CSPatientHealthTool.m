//
//  CSPatientHealthTool.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/29.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSPatientHealthTool.h"
#import "CSPatientCacheTool.h"
#import "CSPatientHealthModel.h"
#import "CSHttpTool.h"
#import "MJExtension.h"

@implementation CSPatientHealthTool
+ (void)patientHealthToolSuccess:(void (^)(NSArray *patientHealthArray))success failture:(void (^)(NSError *error))failture{
    NSArray *patientHealthArray = [CSPatientCacheTool PatientHealthModelParam];
    if (patientHealthArray.count) {
        if (success) {
            success(patientHealthArray);
        }
        return;
    }
    [CSHttpTool POST:zixun parameters:nil success:^(id responseObject) {
        if (responseObject) {
            NSArray *patientHealthArray = [CSPatientHealthModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            success(patientHealthArray);
        }
        [CSPatientCacheTool saveWithPatientHealthModel:responseObject[@"data"]];
    } failure:^(NSError *error) {
        failture(error);
    }];
    
}
@end
