//
//  ViewController.m
//  004--ptraceAntiDebug
//
//  Created by H on 2018/6/13.
//  Copyright © 2018年 H. All rights reserved.
//  我更本就不调用你的ptrace!! exit!!
//  支付宝 exit!
//  架构的判断  DYLD 源码!!

#import "ViewController.h"
#import <sys/syscall.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //直接上汇编代码!! 通过中断 触发
    
//    asm(
//        "mov X0,#31\n"//31  PT_DENY_ATTACH
//        "mov X1,#0\n"
//        "mov X2,#0\n"
//        "mov X3,#0\n"
//        "mov w16,#26\n"//这个26代表着ptrace
//        "svc #0x80"//触发中断
//    );
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    asm(
        "mov X0,#0\n"
        "mov w16,#1\n"
        "svc #0x80"
    );
    
}


@end
