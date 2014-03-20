//
//  NSArray+sortClockwise.m
//  WPFax
//
//  Created by 八幡 洋一 on 2014/01/24.
//  Copyright (c) 2014年 バリュークリエイト株式会社. All rights reserved.
//

#import "NSArray+sortClockwise.h"

@implementation NSArray (sortClockwise)

-(NSArray *)sortedViewsClockwise
{
    int total = 1000000;
    UIView* leftTopView = nil;
    for (UIView* view in self) {
        if (total > view.center.x + view.center.y) {
            total = view.center.x + view.center.y;
            leftTopView = view;
        }
    }
    if (leftTopView == nil) {
        return nil;
    }

    UIView* rightTopView = nil;
    for (UIView* view in self) {
        if (view == leftTopView) {
            continue;
        }
        BOOL isRightTopView = YES;
        for (UIView* otherView in self) {
            if (otherView == leftTopView || otherView == view) {
                continue;
            }
            CGPoint rightTopPoint = CGPointMake(view.center.x - leftTopView.center.x,
                                                view.center.y - leftTopView.center.y);
            CGPoint otherPoint = CGPointMake(otherView.center.x - leftTopView.center.x,
                                             otherView.center.y - leftTopView.center.y);
            if (otherPoint.x*rightTopPoint.y - otherPoint.y*rightTopPoint.x < 0) {
                isRightTopView = NO;
            }
        }

        if (isRightTopView) {
            rightTopView = view;
            break;
        }
    }
    if (rightTopView == nil) {
        return nil;
    }

    UIView* rightBottomView = nil;
    for (UIView* view in self) {
        if (view == leftTopView || view == rightTopView) {
            continue;
        }
        BOOL isRightBottomView = YES;
        for (UIView* otherView in self) {
            if (otherView == rightTopView || otherView == view) {
                continue;
            }
            CGPoint rightBottomPoint = CGPointMake(view.center.x - rightTopView.center.x,
                                                   view.center.y - rightTopView.center.y);
            CGPoint otherPoint = CGPointMake(otherView.center.x - rightTopView.center.x,
                                             otherView.center.y - rightTopView.center.y);
            if (otherPoint.x*rightBottomPoint.y - otherPoint.y*rightBottomPoint.x < 0) {
                isRightBottomView = NO;
            }
        }

        if (isRightBottomView) {
            rightBottomView = view;
            break;
        }
    }
    if (rightBottomView == nil) {
        return nil;
    }

    UIView* leftBottomView = nil;
    for (UIView* view in self) {
        if (view == leftTopView || view == rightTopView || view == rightBottomView) {
            continue;
        }

        leftBottomView = view;
    }
    if (leftBottomView == nil) {
        return nil;
    }

    return [NSArray arrayWithObjects:leftTopView, rightTopView, rightBottomView, leftBottomView, nil];
}

@end
