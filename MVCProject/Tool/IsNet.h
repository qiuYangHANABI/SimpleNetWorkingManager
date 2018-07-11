//
//  IsNet.h
//  iOSJiCheHui
//
//  Created by 吉车惠 on 16/12/29.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger{
    KNetUnknown,//未识别的网络
    KNetNone,//无网
    KNetViaWWAN,//2G,3G,4G...的网络
    KNetWifi//wifi的网络
}KNetType;

@interface IsNet : NSObject
+(instancetype)shareIsNet;
@property(nonatomic,assign)KNetType netType;
@end
