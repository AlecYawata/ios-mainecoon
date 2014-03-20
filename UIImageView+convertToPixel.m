//
//  UIImageView+convertToPixel.m
//  WPFax
//
//  Created by 八幡 洋一 on 2014/01/24.
//  Copyright (c) 2014年 バリュークリエイト株式会社. All rights reserved.
//

#import "UIImageView+convertToPixel.h"

@implementation UIImageView (convertToPixel)

-(CGPoint)convertPointToPixel:(CGPoint)point
{
    CGPoint pixelPoint = point;
    float imageScale = MIN(self.frame.size.width / self.image.size.width, self.frame.size.height / self.image.size.height);
    float xScaleSub = self.frame.size.width / self.image.size.width - imageScale;
    float yScaleSub = self.frame.size.height / self.image.size.height - imageScale;
    pixelPoint.x -= self.image.size.width * xScaleSub * 0.5f;
    pixelPoint.y -= self.image.size.height * yScaleSub * 0.5f;
    pixelPoint.x /= imageScale;
    pixelPoint.y /= imageScale;

    return pixelPoint;
}

-(CGPoint)convertPointFromPixel:(CGPoint)pixelPoint
{
    float imageScale = MIN(self.frame.size.width / self.image.size.width, self.frame.size.height / self.image.size.height);
    float xScaleSub = self.frame.size.width / self.image.size.width - imageScale;
    float yScaleSub = self.frame.size.height / self.image.size.height - imageScale;
    pixelPoint.x *= imageScale;
    pixelPoint.y *= imageScale;
    pixelPoint.x += self.image.size.width * xScaleSub * 0.5f;
    pixelPoint.y += self.image.size.height * yScaleSub * 0.5f;

    return pixelPoint;
}

@end
