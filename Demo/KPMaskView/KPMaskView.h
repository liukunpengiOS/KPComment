//
//  KPMaskBaseView.h
//  Drex
//
//  Created by kunpeng on 16/3/8.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPMaskView : UIView

@property (nonatomic,strong) UIWindow *window;/**< 获取Window */
@property (nonatomic,strong) UIView *maskView;/**< 半透明遮罩 */
- (void)initMaskView;/**< 初始化遮罩 */
- (void)showMaskView;/**< 出现遮罩 */
- (void)hiddenMaskView;/**< 隐藏遮罩 */
@end
