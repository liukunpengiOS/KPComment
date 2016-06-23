//
//  KPMaskBaseView.m
//  Drex
//
//  Created by kunpeng on 16/3/8.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "MaskView.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface MaskView ()

@end

@implementation MaskView

- (void)initMaskView {

    _window = [[UIApplication sharedApplication].windows firstObject];
    _window.backgroundColor = [UIColor clearColor];
    _maskView = [[UIView alloc]initWithFrame:_window.bounds];
    _maskView.alpha = 0;
    _maskView.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(gestureEvent)];
    [_maskView addGestureRecognizer:gesture];
}

- (void)showMaskView {
    
    [_window addSubview:_maskView];
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _maskView.alpha = 0.4;
    } completion:nil];
}

- (void)hiddenMaskView {
    
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _maskView.alpha = 0;
    } completion:^(BOOL finished) {
        
            [_maskView removeFromSuperview];
    }];
}

- (void)gestureEvent {
    
    [self hiddenMaskView];
}

@end
