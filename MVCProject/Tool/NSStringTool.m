//
//  NSStringTool.m
//  iOSJiCheHui
//
//  Created by 邢广范 on 2016/12/20.
//  Copyright © 2016年 邢广范. All rights reserved.
//

#import "NSStringTool.h"

@implementation NSStringTool

+(CGFloat)calculationStringHeightWithString:(NSString *)text withFont:(CGFloat)font withWidth:(CGFloat)width
{
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font],} context:nil].size;
    return textSize.height;
}

@end
