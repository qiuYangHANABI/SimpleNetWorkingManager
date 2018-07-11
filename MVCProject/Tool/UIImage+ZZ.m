//
//  UIImage+ZZ.m
//  DaoIOS
//
//  Created by zero on 15/9/7.
//  Copyright (c) 2015年 shenlan. All rights reserved.
//

#import "UIImage+ZZ.h"

@implementation UIImage (ZZ)
//给定imageView尺寸，截取部分图像
- (UIImage *)imageForSize:(CGSize)size {
    UIImage *image = [self scaleToBigOfSize:CGSizeMake(size.width*2, size.height*2)];
    return image;
}


//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CFRelease(subImageRef);
    return smallImage;
}

//等比例缩放 取边长最短的一边
-(UIImage*)scaleToSmallOfSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1)
    {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}


//等比例缩放 取边长最长的一边
-(UIImage*)scaleToBigOfSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1)
    {
        radio = verticalRadio > horizontalRadio ? verticalRadio : horizontalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? horizontalRadio : verticalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

/** 返回一张颜色图片 */
+ (UIImage *)ImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

- (UIImage *)resizedImageWithLeft:(CGFloat)left top:(CGFloat)top {
    return [self stretchableImageWithLeftCapWidth:self.size.width * left topCapHeight:self.size.height * top];
}


+ (UIImage *)roundImageWithImage:(UIImage *)image cornerRadius:(CGFloat)radius{
    
    CGFloat dealt = image.size.width - image.size.height;
    CGRect tempRect = CGRectZero;
    if (dealt >= 0) {
        tempRect = CGRectMake(0, 0, image.size.width/image.size.height * radius*2, radius*2);
    } else {
        tempRect = CGRectMake(0, 0, radius*2, radius*2 * image.size.height /image.size.width );
    }
    
    UIGraphicsBeginImageContext(tempRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [image drawInRect:tempRect];
    CGContextTranslateCTM(context, 0, tempRect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, tempRect, image.CGImage);
    //    CGContextClipToRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

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


- (UIImage *)imageForSize:(CGSize)size vertical:(ImageVertical)vertical horizontal:(ImageHorizontal)horizontal {
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float imageRadio = width/height;
    float sizeRadio = size.width/size.height;
    CGRect rect = CGRectZero;
    if(imageRadio>sizeRadio) {//裁剪宽
        if(horizontal == ImageHorizontalLeft){//左
            rect = CGRectMake(0, 0, height * sizeRadio, height);
        }else if (horizontal == ImageHorizontalCenter){//中
            rect = CGRectMake((width - height * sizeRadio)*0.5, 0, height * sizeRadio, height);
        }else{//右
            rect = CGRectMake(width - height * sizeRadio, 0, height * sizeRadio, height);
        }
    }else {//裁剪高
        if(horizontal == ImageVerticalTop){//左
            rect = CGRectMake(0, 0, width,width * size.height/size.width);
        }else if (horizontal == ImageVerticalCenter){//中
            rect = CGRectMake(0, (height - width * size.height/size.width)*0.5, width, width * size.height/size.width);
        }else{//右
            rect = CGRectMake(0, height - width * size.height/size.width, width, width * size.height/size.width);
        }
    }
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:subImageRef scale:2.0 orientation:0];
    CFRelease(subImageRef);
    
    // 返回新的改变大小后的图片
    return image;
}

//按宽度等比例缩放（给定宽度）
-(UIImage*)scaleToSmallWithWidth:(CGFloat)aWidth
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(2*aWidth, 2*aWidth*height/width));
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, 2*aWidth, 2*aWidth*height/width)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}


@end
