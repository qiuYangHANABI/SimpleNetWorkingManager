//
//  MyConfig.m
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/11.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "MyConfig.h"

@implementation MyConfig

static MyConfig *myConfig;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isShowLog = YES;
    }
    return self;
}
+ (instancetype)sharedMyConfig{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myConfig = [[MyConfig alloc]init];
    });
    return myConfig;
}
- (void)setToken:(NSString *)token{
    _token = token;
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"token========%@", token);
}
- (NSString *)token{
    if (!_token) {
        _token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    }
    return _token;
}

@end
