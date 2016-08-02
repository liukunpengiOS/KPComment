//
//  KPCommnetView.m
//  KPCommentView
//
//  Created by kunpeng on 16/2/26.
//  Copyright © 2016年 zhiruiyun. All rights reserved.
//

#import "KPComment.h"
#import "CommentBgView.h"

#define INPUT_VIEW_HEIGHT 40
#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface KPComment ()

@property (nonatomic,strong) CommentBgView *inputBgView;
@end

@implementation KPComment

+ (instancetype)commnet {
    static id comment;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        comment = [[KPComment alloc] init];
    });
    return comment;
}

- (void)initMaskView {
    [super initMaskView];
    
    [self configComment];
}

- (void)showMaskView {
    [super showMaskView];
    
    [_inputBgView becomeResponder];
    [self.window insertSubview:_inputBgView
                  aboveSubview:self.maskView];
}

- (void)hiddenMaskView {
    [super hiddenMaskView];
    
    [_inputBgView resignResponder];
    [self clean];
}

- (void)showComment:(contentBlock)contentBlock {
    
    self.contentBlock = contentBlock;
    [self initMaskView];
    [self showMaskView];
}

#pragma mark - 初始化
- (void)configComment {
    
    _inputBgView = [[CommentBgView alloc]initWithFrame:CGRectMake(0, HEIGHT, WIDTH, INPUT_VIEW_HEIGHT)];
    [_inputBgView regiserKeyBoardNotify];
    
    __weak typeof(self)wself = self;
    _inputBgView.keyboardWillShow = ^(NSDictionary *userInfo) {
        
        wself.window.hidden = NO;
        CGFloat keyboardHeight = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]
                                  CGRectValue].size.height;
        CGFloat inputViewOriginY = HEIGHT - keyboardHeight;
        wself.inputBgView.frame = CGRectMake(0, inputViewOriginY - INPUT_VIEW_HEIGHT,
                                        WIDTH, INPUT_VIEW_HEIGHT);
    };
    
    _inputBgView.keyboardWillHidden = ^(NSDictionary *userInfo) {
        
        wself.inputBgView.frame = CGRectMake(0, HEIGHT, WIDTH, INPUT_VIEW_HEIGHT);
    };
    
    _inputBgView.clickReturn = ^(NSString *content) {
        [wself hiddenMaskView];
        if (wself.contentBlock) {
            wself.contentBlock(content);
        }
    };
}

- (void)clean {
    
    [_inputBgView unRegiserKeyBoardNotify];
    [_inputBgView removeFromSuperview];
    _inputBgView = nil;
}

@end
