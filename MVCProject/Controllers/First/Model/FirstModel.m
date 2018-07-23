//
//  FirstModel.m
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/11.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "FirstModel.h"
#import "FirstDataListModel.h"

@implementation FirstModel

-(id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if([property.name isEqualToString:@"dataList"]){
        return [FirstDataListModel mj_objectArrayWithKeyValuesArray:oldValue];
    }
    return oldValue;
}

@end
