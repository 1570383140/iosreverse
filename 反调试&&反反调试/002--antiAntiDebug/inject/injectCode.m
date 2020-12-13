//
//  injectCode.m
//  inject
//
//  Created by H on 2018/6/9.
//  Copyright © 2018年 H. All rights reserved.
//  怎么破?? 调用 ptrace(系统函数??) 保留函数符号
//  重新绑定!! -- fishHook



#import "injectCode.h"
#import "fishhook.h"
#import "MyPtraceHeader.h"

@implementation injectCode

//定义指针,保存原来的函数地址
int (*ptrace_p)(int _request, pid_t _pid, caddr_t _addr, int _data);
//定义自己的函数
int myPtrace(int _request, pid_t _pid, caddr_t _addr, int _data){
    if (_request != PT_DENY_ATTACH) {
        return ptrace_p(_request, _pid, _addr, _data);
    }
    //如果是拒绝加载!不予理会!!
    return 0;
}



+(void)load
{
//    NSLog(@"injectCode来了!!");
    //交换!
    struct rebinding ptraceBd;//fishhook的绑定结构体
    ptraceBd.name = "ptrace";//函数符号
    ptraceBd.replacement = myPtrace;//新函数的地址
    ptraceBd.replaced = (void *)&ptrace_p;//原始函数地址的指针
    //弄一个数组,放fishhook的绑定结构体
    struct rebinding bindings[] = {ptraceBd};
    //fishHook的冲绑定函数!!
    rebind_symbols(bindings, 1);
}

@end
