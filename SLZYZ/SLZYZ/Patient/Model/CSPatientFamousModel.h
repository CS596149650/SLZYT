//
//  CSPatientFamousModel.h
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/29.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//  名医汇

#import <Foundation/Foundation.h>


@interface CSPatientFamousModel : NSObject
/**
 *  用户id
 */
@property (nonatomic, strong) NSString  *uid;
/**
 *  医生姓名
 */
@property (nonatomic, strong) NSString  *dname;
/**
 *  性别（0 男 1 女）
 */
@property (nonatomic, strong) NSString  *sex;
/**
 *  出生日期
 */
@property (nonatomic, strong) NSString  *birthday;
/**
 *  身份证号
 */
@property (nonatomic, strong) NSString  *idcard;
/**
 *  医生编号
 */
@property (nonatomic, strong) NSString  *code;
/**
 *  所在医院
 */
@property (nonatomic, strong) NSString  *hospital;
/**
 *  所属科室id
 */
@property (nonatomic, strong) NSString  *department_id;
/**
 *  职务
 */
@property (nonatomic, strong) NSString  *post;
/**
 *  职称
 */
@property (nonatomic, strong) NSString  *level;
/**
 *  学科分类
 */
@property (nonatomic, strong) NSString  *xtype;
/**
 *  医生类型
 */
@property (nonatomic, strong) NSString  *type;
/**
 *  荣誉简介
 */
@property (nonatomic, strong) NSString  *honor;
/**
 *   简介
 */
@property (nonatomic, strong) NSString  *descriptions;
/**
 *    状态（0 待审核 ，1 审核通过，-1被驳回）
 */
@property (nonatomic, strong) NSString  *status;
/**
 *   更新日期d
 */
@property (nonatomic, strong) NSString  *update_time;
/**
 *  所属科室
 */
@property (nonatomic, strong) NSString  *department;

@end
