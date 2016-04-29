//
//  CSHttpTool.h
//  SLZYZ
//
//  Created by 1780933497@qq.com on 16/4/28.
//  Copyright © 2016年 MrCHEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSHttpTool : NSObject
+ (void)POST:(NSString *)URLString
     parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError * error))failure;

@end
