//
//  BaseOperator.m
//  BaseProject
//
//  Created by zhangrongbing on 16/9/26.
//  Copyright © 2016年 lovcreate. All rights reserved.
//

#import "BaseOperator.h"
#import "NSString+SafyCheck.h"

@implementation BaseOperator

-(instancetype)initWithParams:(NSDictionary *)params{
    if (self = [super init]) {
        _config = [MyConfig sharedMyConfig];
        for (__strong NSString *param in params) {
            param = param.safetyCheck;
        }
        _params = params;
        _supplementAction = [[NSString alloc] init];
        _method = @"post";
        _canCache = NO;
        _autoShowHud = YES;
    }
    return self;
}

-(NSString*)action{
    NSString* actionStr = [NSString stringWithFormat:@"%@/%@",kDomain, _action];
    if (_supplementAction.length > 0) {
        actionStr = [NSString stringWithFormat:@"%@/%@", actionStr, _supplementAction];
    }
    if (_config.isShowLog) {
        NSLog(@"接口地址：%@",actionStr);
        NSLog(@"参数: %@",_params);
    }
    return actionStr;
}

-(void)parseJson:(BaseModel*) baseModel{
    if (_config.isShowLog) {
        NSLog(@"JsonString=%@",baseModel.jsonString);
    }
}

-(void)parseXML:(BaseModel*) baseModel{
    if (_config.isShowLog) {
        NSLog(@"XMLString=%@",baseModel.xmlString);
    }
}

@end
