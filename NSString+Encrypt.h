//
//  NSString+Encrypt.h
//  Encrypt
//
//  Created by アレク八幡 on 2013/09/24.
//  Copyright (c) 2013年 アレク八幡. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)

+(NSString *)hexStringWithData:(NSData*)data withSpaces:(BOOL)spaces capitals:(BOOL)capitals;

-(NSString*) sha256;

-(NSDate*)dateByISOString;

@end
