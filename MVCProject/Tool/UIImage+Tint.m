//
//  UIImage+Tint.m
//  darenshuo
//
//  Created by blue on 15/5/24.
//  Copyright (c) 2015年 blue. All rights reserved.
//

#import "UIImage+Tint.h"

@implementation UIImage (Tint)

- (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    tintedImage = [tintedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return tintedImage;
}

@end
