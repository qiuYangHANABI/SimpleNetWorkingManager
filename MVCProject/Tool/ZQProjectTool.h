//
//  ZQProjectTool.h
//  iOSJiCheHui
//
//  Created by 朱琦 on 2018/5/2.
//  Copyright © 2018年 邢广范. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQProjectTool : NSObject
/**
获取设备名称
 */
+ (NSString *)getDeviceName;
/**
 获取ip对应市
 */
+(NSString *)getCityNameWithIP:(NSString *)ipStr;
/**
 获取ip对应省
 */
+ (NSString *)getProvinceNameWithIP:(NSString *)ipStr;
/**
 获取设备ip
 */
+(NSString *)getIPAddress;
/**
 获取版本号
 */
+(NSString *)getCurrentVersion;

@end
