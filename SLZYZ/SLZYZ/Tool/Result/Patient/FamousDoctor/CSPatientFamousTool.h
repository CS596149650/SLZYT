//
//  CSPatientFamousTool.h
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/29.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPatientFamousTool : NSObject
+ (void)patientFamousToolSuccess:(void (^)(NSArray * patientFamousArray))Success failture:(void (^)(NSError *error))failture;
@end
