//
//  UIImage+ZZ.h
//  DaoIOS
//
//  Created by zero on 15/9/7.
//  Copyright (c) 2015年 shenlan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ImageVerticalTop = 0,
    ImageVerticalCenter,
    ImageVerticalBottom
}ImageVertical;


typedef enum {
    ImageHorizontalLeft = 0,
    ImageHorizontalCenter,
    ImageHorizontalRight
}ImageHorizontal;

@interface UIImage (ZZ)
- (UIImage *)imageForSize:(CGSize)size;
- (UIImage*)getSubImage:(CGRect)rect;
- (UIImage*)scaleToSmallOfSize:(CGSize)size;
- (UIImage*)scaleToBigOfSize:(CGSize)size;

+ (UIImage *)ImageWithColor:(UIColor *)color;
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
- (UIImage *)resizedImageWithLeft:(CGFloat)left top:(CGFloat)top;
+ (UIImage *)roundImageWithImage:(UIImage *)image cornerRadius:(CGFloat)radius;

- (UIImage *) imageWithTintColor:(UIColor *)tintColor;

//按宽度等比例缩放（给定宽度）
-(UIImage*)scaleToSmallWithWidth:(CGFloat)aWidth;

//按规定的尺寸（给定宽高）裁剪图片
//1.若图片原本宽高比大于规定的宽高比，则先将图片缩小的高度缩小／放大到规定高度，再对宽度进行裁剪，裁剪原则：vertical
//1.若图片原本宽高比小于规定的宽高比，则先将图片缩小的宽度缩小／放大到规定宽度，再对高度进行裁剪，裁剪原则：horizontal
- (UIImage *)imageForSize:(CGSize)size vertical:(ImageVertical)vertical horizontal:(ImageHorizontal)horizontal;



@end
