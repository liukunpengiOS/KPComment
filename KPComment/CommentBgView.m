//
//  TCCapsuleDetailToolBar.m
//  TimeCapsuleCompleteEdition
//
//  Created by kunpeng on 15/11/16.
//  Copyright © 2015年 liukunpeng. All rights reserved.
//

#import "CommentBgView.h"
#import "CommnetView.h"

#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface CommentBgView ()<UITextViewDelegate>

@property (nonatomic,strong) CommnetView *inputView;
@end

@implementation CommentBgView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    
        [self setup];
        self.backgroundColor = RGB(245, 245, 245);
    }
    return self;
}

//变成第一响应
- (void)becomeResponder {
    
    [_inputView becomeFirstResponder];
}

//撤销第一响应
- (void)resignResponder {
    [_inputView resignFirstResponder];
}

//初始化设置
- (void)setup {

    _inputView = [[CommnetView alloc]initWithFrame:CGRectMake((WIDTH - WIDTH * 0.98)/2,
                                                              (HEIGHT - HEIGHT * 0.8)/2,
                                                              WIDTH * 0.98, HEIGHT * 0.8)];
    _inputView.delegate = self;
    [self addSubview:_inputView];
}

//注册键盘通知
- (void)regiserKeyBoardNotify {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

//撤销键盘通知
- (void)unRegiserKeyBoardNotify {
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

//键盘弹出回调
- (void)keyboardWillShow:(NSNotification*)notify {
    
    if (self.keyboardWillShow) {
        self.keyboardWillShow(notify.userInfo);
    }
}

//键盘消失回调
- (void)keyboardWillHidden:(NSNotification*)notify {
    
    if (self.keyboardWillHidden) {
        self.keyboardWillHidden(notify.userInfo);
    }
}

//文本输入变化回调
-(BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {
    
    if ([text isEqualToString:@"\n"]) {
        NSInteger textLength = [[textView.text stringByTrimmingCharactersInSet:
                                 [NSCharacterSet whitespaceAndNewlineCharacterSet]]length];
        if (textLength != 0) {
            
            [textView resignFirstResponder];
            if (self.clickReturn) {
                self.clickReturn(textView.text);
            }
        }else {
            
            return NO;
        }
    }
    return YES;
}

@end
