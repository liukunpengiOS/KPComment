//
//  ViewController.m
//  Demo
//
//  Created by kunpeng on 16/6/23.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "ViewController.h"
#import "KPComment.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)cleanContent:(id)sender {
    
    _resultLabel.text = nil;
}

- (IBAction)barItemDidTouch:(id)sender {
    
    __weak typeof(self) wself = self;
    [KPCOMMENT showComment:^(NSString *content) {
        wself.resultLabel.text = content;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
