//
//  KPCommnetView.h
//  KPCommentView
//
//  Created by kunpeng on 16/2/26.
//  Copyright © 2016年 zhiruiyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaskView.h"

#define KPCOMMENT [KPComment commnet]
typedef void(^contentBlock)(NSString *content);
@interface KPComment : MaskView

+ (instancetype)commnet;
@property (nonatomic,copy) contentBlock contentBlock;
@property (nonatomic,strong) NSString *hloderText;
@property (nonatomic,strong) UIFont   *font;
@property (nonatomic,strong) UIColor  *bgColor;

/**
 *  弹出内容输入框
 */
- (void)showComment:(contentBlock)content;

@end
