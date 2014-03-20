//
//  UIView+setProperty.m
//  Force
//
//  Created by 八幡 洋一 on 2013/02/28.
//  Copyright (c) 2013年 八幡 洋一. All rights reserved.
//

#import "UIView+setProperty.h"

@implementation UIView (setProperty)

-(CGPoint)origin
{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    [self setFrame:frame];
}

-(CGSize)size
{
    return self.frame.size;
}

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    [self setFrame:frame];
}


@end
