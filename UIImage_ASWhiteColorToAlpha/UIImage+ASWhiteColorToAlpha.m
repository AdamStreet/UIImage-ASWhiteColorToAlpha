//
//  UIImage+WhiteToTransparent.m
//  PhotoBomb
//
//  Created by Adam Szabo on 12/22/13.
//  Copyright © 2015 Adam Szabo. All rights reserved.
//
//
//The MIT License (MIT)
//
//Copyright (c) 2015 Adam Szabo
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

#import "UIImage+ASWhiteColorToAlpha.h"

#import <ImageIO/ImageIO.h>
#import <CoreGraphics/CoreGraphics.h>

void RGBAWhiteToTransparentFromRGB(unsigned char *red, unsigned char *green, unsigned char *blue, unsigned char *alpha);

@implementation UIImage (ASWhiteColorToAlpha)

- (nonnull UIImage *)imageWithWhiteColorToAlpha
{
	// First get the image into your data buffer
    CGImageRef imageRef = [self CGImage];
	
	static const NSUInteger bytesPerPixel = 4;
	static const NSUInteger bitsPerComponent = 8;
	
    const NSUInteger width = CGImageGetWidth(imageRef);
    const NSUInteger height = CGImageGetHeight(imageRef);
	
	const NSUInteger countOfPixels = (width * height * 4);
    const NSUInteger bytesPerRow = (bytesPerPixel * width);
	
	const CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	
	unsigned char *rawData = (unsigned char*) calloc(countOfPixels, sizeof(unsigned char));
	
	// Create context
    CGContextRef context = CGBitmapContextCreate(rawData,
												 width, height,
												 bitsPerComponent, bytesPerRow,
												 colorSpace,
												 (kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big));
	
	//Draw image
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
	
	// Now your rawData contains the image data in the RGBA8888 pixel format.
    for (int byteIndex = 0 ; byteIndex < countOfPixels; byteIndex += bytesPerPixel)
    {
		unsigned char *red   = &(rawData[byteIndex]);
        unsigned char *green = &(rawData[byteIndex + 1]);
        unsigned char *blue  = &(rawData[byteIndex + 2]);
        unsigned char *alpha = &(rawData[byteIndex + 3]);
		
        RGBAWhiteToTransparentFromRGB(red, green, blue, alpha);
    }
	
	// Get image
	CGImageRef result = CGBitmapContextCreateImage(context);
	UIImage *returnImage = [UIImage imageWithCGImage:result];
	
	// Release
	CGImageRelease(result);
	CGContextRelease(context);
	CGColorSpaceRelease(colorSpace);
	free(rawData);
	
	return returnImage;
}

@end

inline void RGBAWhiteToTransparentFromRGB(unsigned char *red, unsigned char *green, unsigned char *blue, unsigned char *alpha)
{
	// Get average colorness value of the pixel
	//unsigned char maxValue = MAX(MAX(*red, *green), *blue);
	unsigned char minValue = MIN(MIN(*red, *green), *blue);
	
	// Minimalize RGB / maximalize color
	*red -= minValue;
	*green -= minValue;
	*blue -= minValue;
	
	// 255 (white) -> alpha = 0
	// 0 (black) -> alpha = 255
	
	*alpha = (255.0 - minValue);
}