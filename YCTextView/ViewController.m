//
//  ViewController.m
//  YCTextView
//
//  Created by 任义春 on 16/6/28.
//  Copyright © 2016年 renyichun. All rights reserved.
//

#import "ViewController.h"
#import "YCPlaceholderTextView.h"
@interface ViewController ()
/** 输入框 */
@property (nonatomic, strong) YCPlaceholderTextView *textView;

/** 测试输入框的父视图的高度改变 */
@property (nonatomic, strong) UIView *bgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

  
    self.textView = [[YCPlaceholderTextView alloc] initWithFrame:CGRectMake(10, 100, 300, 30)];
    self.textView.placeholder = @"请输入文字....";
    self.textView.placeholderColor = [UIColor greenColor];
    self.textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.textView];
    

    // fixbug分支，修复了1.1bug


    // 测试，还未开发完成

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
