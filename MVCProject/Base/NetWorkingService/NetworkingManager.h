//
//  NetworkingManager.h
//  BaseProject
//
//  Created by zhangrongbing on 16/9/26.
//  Copyright © 2016年 lovcreate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOperator.h"
#import "AFNetworking.h"
#import "MyConfig.h"

@class  BaseViewController;

@interface NetworkingManager : NSObject

/** 服务器超时提示 */
@property(nonatomic, copy)NSString *timeOutMessage;

/**
 异步访问接口方法
 
 @param controller   所在控制器
 @param baseOperator 接口操作类
 @param successBlock 成功回调块
 @param failBlock    失败回调块
 */
-(void)asyncTaskOnVC:(BaseViewController*) controller operator:(BaseOperator*) baseOperator successBlock:(void(^)(BaseModel* baseModel)) successBlock failBlock:(void(^)(BaseModel* baseModel)) failBlock;

-(void)asyncUploadTaskOnVC:(BaseViewController*) controller operator:(BaseOperator*) baseOperator successBlock:(void(^)(BaseModel* baseModel)) successBlock failBlock:(void(^)(BaseModel* baseModel)) failBlock;

@end
