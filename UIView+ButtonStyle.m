//
//  UIView+ButtonStyle.m
//  WPFax
//
//  Created by 八幡 洋一 on 2014/02/04.
//  Copyright (c) 2014年 バリュークリエイト株式会社. All rights reserved.
//

#import "UIView+ButtonStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (ButtonStyle)

-(void)setButtonStyleWithCornerRadius:(float)cornerRadius
{
    [self.layer setCornerRadius:cornerRadius];
    [self.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.layer setBorderWidth:0.5f];
    [self setClipsToBounds:YES];
}

@end
