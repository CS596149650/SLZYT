//
//  CSPatientCacheTool.m
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/29.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import "CSPatientCacheTool.h"
#import "FMDB.h"
#import "MJExtension.h"

#import "CSPatientLunboModel.h"
#import "CSPatientFamousModel.h"
#import "CSPatientHealthModel.h"
static FMDatabase *_db;
@implementation CSPatientCacheTool
+ (void)initialize{
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [cachePath stringByAppendingPathComponent:@"Patient.sqlite"];
    _db = [FMDatabase databaseWithPath:filePath];
    
    
    if ([_db open]) {
        NSLog(@"patient数据库打开成功");
    }
    else{
        NSLog(@"打开失败");
    }
    BOOL PatientLunBoFlag = [_db executeUpdate:@"create table if not exists t_lunbo (id integer primary key autoincrement, dict blob);"];
    BOOL PatientFamousFlag = [_db executeUpdate:@"create table if not exists t_famous (id integer primary key autoincrement, dict blob);"];
    BOOL PatientHealthFlag = [_db executeUpdate:@"create table if not exists t_health (id integer primary key autoincrement, dict blob);"];
    if (PatientLunBoFlag) {
        CSLog(@"luobo创建成功");
    }
    else{
        CSLog(@"luobo创建失败");
    }
    if (PatientFamousFlag) {
        CSLog(@"patientfamous创建成功");
    }else{
        CSLog(@"patientfamous创建失败");
    }
    if (PatientHealthFlag) {
        CSLog(@"patienthealthflag创建成功");
    }else{
        CSLog(@"patienthealthflag创建失败");
    }
    
}

//存数据 : 患者轮播图
+ (void)saveWithPatintLunBoModel:(NSArray *)PatintLunBoModel{
    for (NSDictionary *lunboDict in PatintLunBoModel) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:lunboDict];
        BOOL flag = [_db executeUpdate:@"insert into t_lunbo(dict) values(?)", data];
        if (flag) {
            CSLog(@"患者轮播图插入成功");
        }
        else{
            CSLog(@"患者轮播图插入失败");
        }
    }
}
//取数据
+ (NSArray *)PatintLunBoModelWithParam{
    FMResultSet *result = [_db executeQuery:@"select *from t_lunbo"];
    NSMutableArray *arrM = [NSMutableArray array];
    while ([result next]) {
        NSData *data = [result dataForColumn:@"dict"];
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        CSPatientLunboModel *model = [CSPatientLunboModel mj_objectWithKeyValues:dict];
        [arrM addObject:model];
    }
    return arrM;
    
}
//患者名医汇
+ (void)saveWithPatientFamousModel:(NSArray *)patientFamousModel{
    for (NSDictionary *famousDict in patientFamousModel) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:famousDict];
        BOOL flag = [_db executeUpdate:@"insert into t_famous(dict) values (?)", data];
        if (flag) {
            CSLog(@"患者名医汇插入成功");
        }else{
            CSLog(@"患者名医汇插入失败");
        }
    }
}

+ (NSArray *)PatientFamousModelParam{
    FMResultSet *result = [_db executeQuery:@"select *from t_famous"];
    NSMutableArray *arrM = [NSMutableArray array];
    while ([result next]) {
        NSData *data = [result dataForColumn:@"dict"];
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        CSPatientFamousModel *model = [CSPatientFamousModel mj_objectWithKeyValues:dict];
        [arrM addObject:model];
        
    }
    return arrM;
}
//患者健康咨询
+ (void)saveWithPatientHealthModel:(NSArray *)patientHealthModel{
    for (NSDictionary *healthDict in patientHealthModel) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:healthDict];
        BOOL flag = [_db executeUpdate:@"insert into t_health(dict) values (?)", data];
        if (flag) {
            CSLog(@"患者健康咨询插入成功");
        }else{
            CSLog(@"患者健康插入失败");
        }
    }
}

+ (NSArray *)PatientHealthModelParam{
    FMResultSet *result = [_db executeQuery:@"select *from t_health"];
    NSMutableArray *arrM = [NSMutableArray array];
    while ([result next]) {
        NSData *data = [result dataForColumn:@"dict"];
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        CSPatientHealthModel *model  = [CSPatientHealthModel mj_objectWithKeyValues:dict];
        [arrM addObject:model];
    }
    return arrM;
}


@end
