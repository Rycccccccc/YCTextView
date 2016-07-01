//
//  YCPlaceholderTextView.h
//  YC百思
//
//  Created by 任任义春 on 16/6/11.
//  Copyright © 2016年 renyihcun. All rights reserved.
//  拥有占位文字的UITextView

#import <UIKit/UIKit.h>

@interface YCPlaceholderTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;

/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;


@end
