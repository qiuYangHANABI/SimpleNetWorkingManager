//
//  IsNet.m
//  iOSJiCheHui
//
//  Created by 吉车惠 on 16/12/29.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import "IsNet.h"

@implementation IsNet
static IsNet* isNet = nil;
+(instancetype)shareIsNet{
    static dispatch_once_t onceNet;
    dispatch_once(&onceNet, ^{
        if(!isNet){
            isNet = [[self alloc]init];
        }
    });
    return isNet;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceNet;
    dispatch_once(&onceNet, ^{
        if(!isNet){
            isNet = [super allocWithZone:zone];
        }
    });
    return isNet;
}

@end
