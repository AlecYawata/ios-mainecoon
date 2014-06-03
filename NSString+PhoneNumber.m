//
//  NSString+PhoneNumber.m
//  WPFax
//
//  Created by 八幡 洋一 on 2014/02/04.
//  Copyright (c) 2014年 バリュークリエイト株式会社. All rights reserved.
//

#import "NSString+PhoneNumber.h"

@implementation NSString (PhoneNumber)

-(NSString *)hyphenString
{
    if ([self rangeOfString:@"-"].location != NSNotFound) {
        return [NSString stringWithString:self];
    }
    if ([self rangeOfString:@" "].location != NSNotFound) {
        return [self stringByReplacingOccurrencesOfString:@" " withString:@"-"];
    }
    return [NSString stringWithString:self];
}

-(NSString *)nonHyphenString
{
    NSString* string = self;
    string = [string stringByReplacingOccurrencesOfString:@"+81" withString:@"0"];
    string = [string stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, string.length)];
    string = [string stringByReplacingOccurrencesOfString:@"-" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return string;
}

@end
