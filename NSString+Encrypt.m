//
//  NSString+Encrypt.m
//  Encrypt
//
//  Created by アレク八幡 on 2013/09/24.
//  Copyright (c) 2013年 アレク八幡. All rights reserved.
//

#import "NSString+Encrypt.h"
#import <CommonCrypto/CommonHMAC.h>
#import "Base64.h"

@implementation NSString (Encrypt)

//
//  NSData+Encrypt.m
//
//  Based on code by AliSoftware
//  http://stackoverflow.com/a/7520723/60488
//
+(NSString *)hexStringWithData:(NSData *)data withSpaces:(BOOL)spaces capitals:(BOOL)capitals
{
    const unsigned char *bytes = (const unsigned char *)[data bytes];
    NSUInteger nbBytes = [data length];
    // If spaces is true, insert a space every this many input bytes (twice this many output characters).
    static const NSUInteger spaceEveryThisManyBytes = 4UL;
    // If spaces is true, insert a line-break instead of a space every this many spaces.
    static const NSUInteger lineBreakEveryThisManySpaces = 4UL;
    const NSUInteger lineBreakEveryThisManyBytes = spaceEveryThisManyBytes * lineBreakEveryThisManySpaces;
    NSUInteger strLen = 2 * nbBytes + (spaces ? nbBytes / spaceEveryThisManyBytes : 0);

    NSMutableString *hex = [[NSMutableString alloc] initWithCapacity:strLen];

    for (NSUInteger i = 0; i < nbBytes; ) {
        if (capitals) {
            [hex appendFormat:@"%02X", bytes[i]];
        } else {
            [hex appendFormat:@"%02x", bytes[i]];
        }
        // We need to increment here so that the every-n-bytes computations are right.
        ++i;

        if (spaces) {
            if (i % lineBreakEveryThisManyBytes == 0) {
                [hex appendString:@"\n"];
            } else if (i % spaceEveryThisManyBytes == 0) {
                [hex appendString:@" "];
            }
        }
    }
    return [hex autorelease];
}

-(NSString*) sha256
{
    const char *s=[self cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData=[NSData dataWithBytes:s length:strlen(s)];

    uint8_t digest[CC_SHA256_DIGEST_LENGTH]={0};
    CC_SHA256(keyData.bytes, keyData.length, digest);
    NSData *out =
    [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *hash=[out description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

-(NSDate *)dateByISOString
{
    static NSDateFormatter* dateFormatter = nil;
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Tokyo"]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    return [dateFormatter dateFromString:self];
}

@end
