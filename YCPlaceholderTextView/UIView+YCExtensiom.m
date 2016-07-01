//
//  UIView+YCExtensiom.m
//  YC百思
//
//  Created by 任任义春 on 16/5/12.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "UIView+YCExtensiom.h"

@implementation UIView (YCExtensiom)

#pragma mark --- set method
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

#pragma mark --- get method

- (CGSize)size {
    return self.frame.size;
}
- (CGFloat)width {
    return self.frame.size.width;
}
- (CGFloat)height {
    return self.frame.size.height;
}
- (CGFloat)x {
    return self.frame.origin.x;
}
- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)centerX
{
    return self.center.x;
}




+ (instancetype)viewFromXib {
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}





/**
*  判断一个控件是否真正显示在主窗口
*/
- (BOOL)isShowingOnKeyWindow {
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点，计算self 的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBunds = keyWindow.bounds;

    // 主窗口的bounds 和 self 的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBunds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}

@end
