//
//  CSPatientCacheTool.h
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/29.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPatientCacheTool : NSObject
// 轮播图模型数组（PatintLunBoModel）
+ (void)saveWithPatintLunBoModel:(NSArray *)PatintLunBoModel;

+ (NSArray *)PatintLunBoModelWithParam;
// 名医汇
+ (void)saveWithPatientFamousModel:(NSArray *)patientFamousModel;
+ (NSArray *)PatientFamousModelParam;
// 健康咨询
+ (void)saveWithPatientHealthModel:(NSArray *)patientHealthModel;
+ (NSArray *)PatientHealthModelParam;

@end
