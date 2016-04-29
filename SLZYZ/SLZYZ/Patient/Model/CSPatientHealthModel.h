//
//  CSPatientHealthModel.h
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/29.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//  健康咨询

#import <Foundation/Foundation.h>

@interface CSPatientHealthModel : NSObject
/**
 *  自增id
 */
//@property (nonatomic, strong) NSString  *id;

/**
 *  咨询标题
 */
@property (nonatomic, strong) NSString  *title;
/**
 *  内容
 */
@property (nonatomic, strong) NSString  *content;
/**
 *  咨询图片路径
 */
@property (nonatomic, strong) NSString  *image;
/**
 *  创建时间/更新时间
 */
@property (nonatomic, strong) NSString  *create_time;

@end
