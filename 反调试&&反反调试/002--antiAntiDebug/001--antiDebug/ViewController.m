//
//  ViewController.m
//  001--antiDebug
//
//  Created by H on 2018/6/9.
//  Copyright © 2018年 H. All rights reserved.
//

#import "ViewController.h"
#import "MyPtraceHeader.h"

@interface ViewController ()

@end

@implementation ViewController

+(void)load
{
//    NSLog(@"ViewController 来了!");
}

/*
 ptrace(process trace 进程跟踪)
 此函数提供了一个进程监听控制另外一个进程.并且可以检测被控制进程的内存和寄存器里面的数据!它可以用来实现断点调试和系统调用跟踪.debugserver就是用的它
 iOS 中没有提供相关的头.
 <程序员的自我修养>
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     arg1:ptrace要做的事情
     arg2:要操作进程的ID
     arg3(地址)\arg4(数据): 取决于arg1
     */
//    ptrace(PT_DENY_ATTACH, 0, 0, 0);
    /**
     1.反ptrance防护
        新建antiDebug.framework
        把antiDebug.frame在配置文件build phases中上移到最前面
     2.通过fishHook反hook
    **/
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击了!");
    // Dispose of any resources that can be recreated.
}


@end
