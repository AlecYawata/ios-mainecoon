//
//  NSArray+randomized.m
//  OneWolf
//
//  Created by 八幡 洋一 on 2013/03/18.
//  Copyright (c) 2013年 ウサミミ研究所. All rights reserved.
//

#import "NSArray+randomized.h"

@implementation NSArray (randomized)

- (NSArray *) randomizedArray {
    NSMutableArray *results = [NSMutableArray arrayWithArray:self];
    int i = [results count];
    
    while(--i) {
        int j = rand() % (i+1);
        [results exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    return [NSArray arrayWithArray:results];
}

@end