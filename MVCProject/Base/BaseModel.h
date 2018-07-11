//
//  BaseModel.h
//  BaseProject
//
//  Created by zhangrongbing on 16/9/26.
//  Copyright © 2016年 lovcreate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface BaseModel : NSObject

@property(nonatomic, strong) NSString* ret;
@property(nonatomic, strong) NSString* ver;
@property(nonatomic, strong) NSString* message;


/**
 json字符串 接口返回的原始数据
 */
@property(nonatomic, strong) NSString* jsonString;

/**
 xml字符串 接口返回的原始数据
 */
@property(nonatomic, strong) NSString* xmlString;

@end
