//
//  TCCapsuleDetailToolBar.h
//  TimeCapsuleCompleteEdition
//
//  Created by kunpeng on 15/11/16.
//  Copyright © 2015年 liukunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputView.h"

@interface BgView : UIView

/**
 *  变成第一相应
 */
- (void)becomeResponder;

/**
 *  撤销第一响应
 */
- (void)resignResponder;

/**
 *  注册键盘通知
 */
- (void)regiserKeyBoardNotify;

/**
 *  撤销键盘通知
 */
- (void)unRegiserKeyBoardNotify;

/**
 *  Return回调
 */
@property (nonatomic,copy) void (^clickReturn)(NSString *text);

/**
 *  键盘即将出现
 */
@property (nonatomic,copy) void(^keyboardWillShow)(NSDictionary *userInfo);

/**
 *  键盘即将消失
 */
@property (nonatomic,copy) void(^keyboardWillHidden)(NSDictionary *userInfo);

@end

