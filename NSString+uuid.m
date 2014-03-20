//
//  NSString+uuid.m
//  WPFax
//
//  Created by 八幡 洋一 on 2014/03/08.
//  Copyright (c) 2014年 バリュークリエイト株式会社. All rights reserved.
//

#import "NSString+uuid.h"

@implementation NSString (uuid)

+(NSString*)uuidString
{
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    NSString *sendIdentifier = (__bridge NSString*)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    CFRelease(uuidObject);

    return sendIdentifier;
}

@end
