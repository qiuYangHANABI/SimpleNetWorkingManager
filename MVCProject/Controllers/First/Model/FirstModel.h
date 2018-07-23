//
//  FirstModel.h
//  MVCProject
//
//  Created by 黃秋陽 on 2018/7/11.
//  Copyright © 2018年 黃秋陽. All rights reserved.
//

#import "BaseModel.h"

@interface FirstModel : BaseModel

@property (nonatomic, copy) NSString *string;
@property (nonatomic, copy) NSString *string2;
@property (nonatomic, strong) NSArray *dataList;

@end
