//
//  BaseOperator.h
//  BaseProject
//
//  Created by zhangrongbing on 16/9/26.
//  Copyright © 2016年 lovcreate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyConfig.h"
#import "BaseModel.h"
#import "MBProgressHUD.h"

@interface BaseOperator : NSObject

/**
 参数  默认为空字典
 */
@property(nonatomic, strong) NSDictionary* params;

/**
 接口的地址(除去IP地址或域名)
 */
@property(nonatomic, strong) NSString* action;

/**
 扩展的action地址   默认为空字符串
 */
@property(nonatomic, strong) NSString* supplementAction;


/**
 请求方式  默认为POST方式
 */
@property(nonatomic, strong) NSString* method;


/**
 工程配置文件
 */
@property(nonatomic, strong) MyConfig* config;

/**
 是否看起缓存 默认为NO
 */
@property(nonatomic)BOOL canCache;

/**
 自动显示菊花，默认为 YES 如果接口连掉的时候需要手动关闭，并手动控制开启、关闭
 */
@property(nonatomic) BOOL autoShowHud;
/**
 接口数据解析方法
 
 @param baseModel 数据模型的基类  如果把缓存打开，此方法将被调用两次（缓存存在）。
 */

@property(nonatomic,strong) NSArray<NSData*>* uploadDatas;
@property(nonatomic,strong) NSArray<NSString*>* uploadKeys;

-(void)parseJson:(BaseModel*) baseModel;

-(void)parseXML:(BaseModel*) baseModel;

-(instancetype)initWithParams:(NSDictionary *)params;
@end
