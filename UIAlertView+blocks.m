//
//  UIAlertView+blocks.m
//  WPFax
//
//  Created by 八幡 洋一 on 2014/02/12.
//  Copyright (c) 2014年 バリュークリエイト株式会社. All rights reserved.
//

#import "UIAlertView+blocks.h"

@implementation UIAlertView (blocks)

- (id)initWithTitle:(NSString *)title message:(NSString *)message callback:(UIAlertViewCallback_t)callback  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {

    self = [self initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if(self) {
        // otherButtonTitles, ... を手動でセット
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*)) {
            [self addButtonWithTitle:arg];
        }
        va_end(args);

        // delegateにUIAlertViewCallbackをセット
        self.delegate = [[[UIAlertViewCallback alloc] initWithCallback:callback] autorelease];
    }
    return self;
}

@end



@implementation UIAlertViewCallback

@synthesize callback;

- (id)initWithCallback:(UIAlertViewCallback_t)aCallback {
    if(self = [super init]) {
        // コールバックブロックをセット
        self.callback = aCallback;

        // 自分自身を保持！
        [self retain];
    }
    return self;
}

// UIAlertView の delegate メソッド
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // コールバックを呼ぶ
    if(callback)
        callback(alertView, buttonIndex);

    // コールバックを呼び終えたら自分自身を解放する！
    [self release];
}

- (void)dealloc {
    self.callback = nil;
    [super dealloc];
}

@end