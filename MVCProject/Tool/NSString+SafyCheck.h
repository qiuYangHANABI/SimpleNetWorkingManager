//
//  NSString+SafyCheck.h
//  iOSJiCheHui
//
//  Created by 黄秋阳 on 2017/9/20.
//  Copyright © 2017年 邢广范. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SafyCheck)

/** 过滤非法字符 */
- (NSString *)safetyCheck;

@end
