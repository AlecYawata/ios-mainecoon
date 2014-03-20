//
//  NSString+Comma.h
//  wanchu
//
//  Created by 八幡 洋一 on 2013/06/25.
//  Copyright (c) 2013年 青木美也子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Comma)

-(int) intValueWithoutComma;
+(NSString*)commaStringWithInt:(int)value;

@end
