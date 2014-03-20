//
//  UIImage+AutoSize.m
//  wanchu
//
//  Created by 八幡 洋一 on 2013/07/24.
//  Copyright (c) 2013年 青木美也子. All rights reserved.
//

#import "UIImage+AutoSize.h"

@implementation UIImage (AutoSize)

+(UIImage *)imageAutoNamed:(NSString *)name
{
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;

    NSString* suffix = @"";
    if (iOSDeviceScreenSize.height == 568) {
        suffix = @"-568h";
    }
    return [UIImage imageNamed:[name stringByAppendingString:suffix]];
}

@end
