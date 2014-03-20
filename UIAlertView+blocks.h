//
//  UIAlertView+blocks.h
//  WPFax
//
//  Created by 八幡 洋一 on 2014/02/12.
//  Copyright (c) 2014年 バリュークリエイト株式会社. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (blocks)

typedef void (^UIAlertViewCallback_t)(UIAlertView* alertView, NSInteger buttonIndex);

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           callback:(UIAlertViewCallback_t)callback
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end



@interface UIAlertViewCallback : NSObject <UIAlertViewDelegate> {
    UIAlertViewCallback_t callback;
}

@property (nonatomic, copy) UIAlertViewCallback_t callback;

- (id)initWithCallback:(UIAlertViewCallback_t) callback;

@end