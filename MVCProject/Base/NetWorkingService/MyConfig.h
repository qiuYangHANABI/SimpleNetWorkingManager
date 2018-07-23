//
//  MyConfig.h
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/11.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//通用信息

#import <Foundation/Foundation.h>

@interface MyConfig : NSObject{
    NSString *_token;
}

@property (nonatomic, copy)NSString *phone;
@property (nonatomic, assign) BOOL isShowLog;

+ (instancetype)sharedMyConfig;
- (void)setToken:(NSString *)token;
- (NSString *)token;

@end
