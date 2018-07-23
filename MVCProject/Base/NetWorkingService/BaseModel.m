//
//  BaseModel.m
//  BaseProject
//
//  Created by zhangrongbing on 16/9/26.
//  Copyright © 2016年 lovcreate. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+(id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"_id"]) {
        return @"id";
    }
    return propertyName;
}

@end
