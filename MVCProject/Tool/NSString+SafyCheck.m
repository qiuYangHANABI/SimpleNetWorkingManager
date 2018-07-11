//
//  NSString+SafyCheck.m
//  iOSJiCheHui
//
//  Created by 黄秋阳 on 2017/9/20.
//  Copyright © 2017年 邢广范. All rights reserved.
//

#import "NSString+SafyCheck.h"

@implementation NSString (SafyCheck)

- (NSString *)safetyCheck{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；:;（）¥「」＂、[]{}#%-*+=_\\|~＜＞<>$€^•'@#$%^&*()_+'\""];
    NSString *finalString = [[self componentsSeparatedByCharactersInSet:set] componentsJoinedByString:@""];
    return finalString;
}

@end
