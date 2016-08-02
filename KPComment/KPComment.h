//
//  KPCommnetView.h
//  KPCommentView
//
//  Created by kunpeng on 16/2/26.
//  Copyright © 2016年 zhiruiyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPMaskView.h"

#define KPCOMMENT [KPComment commnet]
typedef void(^contentBlock)(NSString *content);
@interface KPComment : KPMaskView

+ (instancetype)commnet;

@property (nonatomic,copy) contentBlock contentBlock;

@property (nonatomic,strong) NSString *placeholder;

/** 弹出内容输入框 */
- (void)showComment:(contentBlock)content;

@end
