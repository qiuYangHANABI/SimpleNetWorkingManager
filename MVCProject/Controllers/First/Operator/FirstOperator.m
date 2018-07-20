//
//  FirstOperator.m
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/11.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "FirstOperator.h"

@implementation FirstOperator

- (instancetype)initWithParams:(NSDictionary *)params{
    if (self = [super initWithParams:params]) {
        self.action = @"index.php/commonApi/optionsApi/getForBusinessSwitch";
        self.method = @"get";
    }
    return self;
}

- (void)parseJson:(BaseModel *)baseModel{
    self.data = [FirstModel mj_objectWithKeyValues:baseModel.jsonString];
}

@end
