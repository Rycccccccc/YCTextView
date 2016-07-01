//
//  YCPlaceholderTextView.m
//  YC百思
//
//  Created by 任任义春 on 16/6/11.
//  Copyright © 2016年 renyihcun. All rights reserved.
//

#import "YCPlaceholderTextView.h"
#import "UIView+YCExtensiom.h"
@interface YCPlaceholderTextView ()
/** 占位文字label */
@property (nonatomic, strong) UILabel *placeholderLabel;
@end


@implementation YCPlaceholderTextView


- (UILabel *)placeholderLabel {
    
    if (!_placeholderLabel) {
        
        // 添加一个用来显示占位文字的label
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.x= 4;
        placeholderLabel.y = 7;

        placeholderLabel.numberOfLines = 0;
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        
    }
    
    return _placeholderLabel;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        
//        // 垂直方向上永远有那个弹簧效果
        self.alwaysBounceVertical = YES;
        // 默认字体
        self.font = [UIFont systemFontOfSize:15];
        
        // 默认占位文字颜色
        self.placeholderColor = [UIColor lightGrayColor];
        
        // 切记不要设置自己为自己的代理
        // 用通知来监听文字的改变 
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        
      
        
        
    }
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  监听文字的改变
 */
- (void)textDidChange {
    
    // 只要有文字就隐藏占位文字label
    self.placeholderLabel.hidden = self.hasText;
  
    // 设置最大输入文本的高度
    if (self.contentSize.height > 150) {
        return;
    }
    
    self.height = self.contentSize.height;
    
    // Tips : 当使用本控件在工具条上面的时候，设置下面的这句代码
//    self.superview.height = self.height;
  
    
}

/**
 *  更新占位文字的尺寸
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];

    self.placeholderLabel.width = self.width - 2 * self.placeholderLabel.x;
      [self.placeholderLabel sizeToFit];

}


#pragma mark --- setting  ----别人改的时候，实时改变
- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];// 这里用copy
    
    self.placeholderLabel.text = placeholder;
    
    [self setNeedsLayout];

}
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
    
   
    
}
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
}
- (void)setText:(NSString *)text {
    [super setText:text];
    
    [self textDidChange];
}
- (void)setAttributedText:(NSAttributedString *)attributedText {
    
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

/**
    setNeedsDisplay : 会在恰当的时刻自动调用drawRect
    setNeedsLayout  : 会在恰当的时刻调用layoutSubViews方法
 
 
 */



@end
