# KPComment

simple view for comment

<img src="./Screenshot.gif" width="200" alt="Screenshot" />

安装
---

使用[CocoaPods](http://cocoapods.org)安装

    pod "KPComment"
      
…or simply add KPComment.h/m into your project.
    
调用
---

```
    [KPCOMMENT showComment:^(NSString *content) {
        //打印输入内容
        NSLog(@"%@",content);
    }];

```


许可证
-------
MIT. See LICENSE.
