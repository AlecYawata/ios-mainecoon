//
//  UIImageView+convertToPixel.h
//  WPFax
//
//  Created by 八幡 洋一 on 2014/01/24.
//  Copyright (c) 2014年 バリュークリエイト株式会社. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (convertToPixel)

-(CGPoint) convertPointToPixel:(CGPoint)point;
-(CGPoint) convertPointFromPixel:(CGPoint)point;

@end
