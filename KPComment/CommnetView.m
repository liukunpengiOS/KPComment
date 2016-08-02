//
//  speakTextView.m
//  ailiyunOSSSDKTest
//
//  Created by pangzi on 15/1/9.
//  Copyright (c) 2015年 hnchuangzhiyi. All rights reserved.
//

#import "CommnetView.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface CommnetView ()

@property (nonatomic,strong) UILabel *placeholder;
@end

@implementation CommnetView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
    
        [self setup];
        [self configElements];
    }
    return self;
}

#pragma mark - 初始化区
- (void)setup {
    
    self.returnKeyType = UIReturnKeySend;
    self.font = [UIFont systemFontOfSize:15];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification object:nil];
}

#pragma mark - 配置区
- (void)configElements {
    [self configPlaceholder];
}

- (void)configPlaceholder {
    
    _placeholder = [[UILabel alloc]initWithFrame:self.bounds];
    _placeholder.text = _placeholderText ?: @"  我说两句";
    _placeholder.textColor = RGB(168, 168, 168);
    _placeholder.font = [UIFont systemFontOfSize:15];
    [self addSubview:_placeholder];
}

#pragma mark - 赋值区
- (void)setPlaceholderText:(NSString *)placeholderText {
    _placeholderText = placeholderText;
}

#pragma mark - 事件响应区
- (void)textDidChange:(NSNotification*)notification {
    _placeholder.hidden = self.text.length > 0 ? YES : NO;
}

- (CGSize)boundingRectWithSize:(CGSize)size text:(NSString*)text {
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    CGSize retSize = [text boundingRectWithSize:size
                                        options:NSStringDrawingTruncatesLastVisibleLine|
                                                NSStringDrawingUsesLineFragmentOrigin|
                                                NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}

@end
