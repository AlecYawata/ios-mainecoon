//
//  NSString+Comma.m
//  wanchu
//
//  Created by 八幡 洋一 on 2013/06/25.
//  Copyright (c) 2013年 青木美也子. All rights reserved.
//

#import "NSString+Comma.h"

@implementation NSString (Comma)

-(int)intValueWithoutComma
{
    NSString* valueString = [self stringByReplacingOccurrencesOfString:@"," withString:@""];
    return [valueString intValue];
}

+(NSString *)commaStringWithInt:(int)value
{
    NSNumber *valueNumber = [NSNumber numberWithInt:value];

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setGroupingSize:3];
    [formatter setGroupingSeparator:@","];

    return [formatter stringFromNumber:valueNumber];
}

@end
