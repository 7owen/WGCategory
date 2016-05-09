//
//  UIColor+Image.m
//  xueQingStudy
//
//  Created by 7owen on 16/5/4.
//  Copyright © 2016年 Founder. All rights reserved.
//

#import "UIColor+Image.h"

@implementation UIColor (Image)

- (UIImage*)imageWithSize:(CGSize)size {
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        return nil;
    }
    //参数size类型为CGSize，size.width有可能为小数，会造成CGBitmapContextCreate返回NULL,从而死机。
    //原因是如果width为小数，CGBitmapContextCreate函数的第5个参数bytesPerRow不是第2个参数的4倍，
    //Each row of the bitmap consists of `bytesPerRow' bytes, which must be at least `width * bytes per pixel' bytes
    size_t width  = (size_t)size.width;
    size_t height = (size_t)size.height;
    const CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    const CGContextRef context = CGBitmapContextCreate(
                                                       NULL,
                                                       width, height,
                                                       8, width * 4,
                                                       colorspace, (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    
    NSParameterAssert(context);
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    CGImageRef drawnImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorspace);
    UIImage *image = [UIImage imageWithCGImage:drawnImage];
    CGImageRelease(drawnImage);
    
    return image;
}

@end
