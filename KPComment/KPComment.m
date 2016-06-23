//
//  KPCommnetView.m
//  KPCommentView
//
//  Created by kunpeng on 16/2/26.
//  Copyright © 2016年 zhiruiyun. All rights reserved.
//

#import "KPComment.h"
#import "BgView.h"

#define INPUT_VIEW_HEIGHT 40
#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface KPComment ()

@property (nonatomic,assign) CGFloat keyboardHeight;
@property (nonatomic,assign) CGFloat inputViewOriginY;
@property (nonatomic,strong) BgView *bgView;
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
    [self initComment];
}

- (void)showMaskView {
    [super showMaskView];
    [self.window insertSubview:_bgView aboveSubview:self.maskView];
    [_bgView becomeResponder];
}

- (void)hiddenMaskView {
    [super hiddenMaskView];
    [_bgView resignResponder];
    [self clean];
}

- (void)showComment:(contentBlock)contentBlock {
    
    self.contentBlock = contentBlock;
    [self initMaskView];
    [self showMaskView];
}

#pragma mark - 初始化
- (void)initComment {
    
    _bgView = [[BgView alloc]initWithFrame:CGRectMake(0, HEIGHT, WIDTH,INPUT_VIEW_HEIGHT)];
    [_bgView regiserKeyBoardNotify];
    [self.window insertSubview:_bgView aboveSubview:self.maskView];
    
    __weak typeof(self)wself = self;
    _bgView.keyboardWillShow = ^(NSDictionary *userInfo) {
        wself.window.hidden = NO;
        CGFloat keyboardHeight = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        wself.inputViewOriginY = HEIGHT - keyboardHeight;
        wself.bgView.frame = CGRectMake(0, wself.inputViewOriginY - INPUT_VIEW_HEIGHT,WIDTH, INPUT_VIEW_HEIGHT);
    };
    
    _bgView.keyboardWillHidden = ^(NSDictionary *userInfo) {
        wself.bgView.frame = CGRectMake(0, HEIGHT, WIDTH, INPUT_VIEW_HEIGHT);
    };
    
    _bgView.clickReturn = ^(NSString *content) {
        [wself hiddenMaskView];
        if (wself.contentBlock) {
            wself.contentBlock(content);
        }
    };
}

//清理
- (void)clean {
    
    [_bgView unRegiserKeyBoardNotify];
    [_bgView removeFromSuperview];
    _bgView = nil;
}

@end
