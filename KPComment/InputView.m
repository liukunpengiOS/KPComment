//
//  speakTextView.m
//  ailiyunOSSSDKTest
//
//  Created by pangzi on 15/1/9.
//  Copyright (c) 2015年 hnchuangzhiyi. All rights reserved.
//

#import "InputView.h"

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface InputView ()

@property (nonatomic,strong) UILabel *placeholder;
@end

@implementation InputView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
    
        [self setup];
    }
    return self;
}

- (void)setup {
    
     _placeholder = [[UILabel alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:nil];

    self.font = [UIFont systemFontOfSize:15];
    self.returnKeyType = UIReturnKeySend;
    [self setPlaceHolder];
}

- (void)setPlaceHolder {
    
    _placeholder.text = @"我要吐槽...";
    _placeholder.textColor = RGB(168, 168, 168);
    _placeholder.font = [UIFont systemFontOfSize:15];
    [self addSubview:_placeholder];
    CGSize size = [self boundingRectWithSize:CGSizeMake(0, 0) text:_placeholder.text];
    _placeholder.frame = CGRectMake(5,(CGRectGetHeight(self.frame) - size.height)/2,
                                    size.width, size.height);
}

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
