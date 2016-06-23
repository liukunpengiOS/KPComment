//
//  KPMaskBaseView.h
//  Drex
//
//  Created by kunpeng on 16/3/8.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaskView : UIView

/**
 *  初始化遮罩
 */
- (void)initMaskView;

/**
 *  弹出遮罩
 */
- (void)showMaskView;

/**
 *  退出遮罩
 */
- (void)hiddenMaskView;

/**
 *  创建UIWindow实例
 */
@property (nonatomic,strong) UIWindow *window;

/**
 *  黑色半透明遮罩
 */
@property (nonatomic,strong) UIView *maskView;

@end
