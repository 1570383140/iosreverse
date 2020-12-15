//
//  antiDebugCode.m
//  antiDebug
//
//  Created by H on 2018/6/10.
//  Copyright © 2018年 H. All rights reserved.
//

#import "antiDebugCode.h"
#import "MyPtraceHeader.h"
#import <sys/sysctl.h>

@implementation antiDebugCode
//检测是否是调试状态,就一次.课防止住 利用Xcode重签这种情况!
BOOL isDebugger(){
    int name[4];//里面放字节码.查询的信息
    name[0] = CTL_KERN;//内核(kernel)查询
    name[1] = KERN_PROC;//查询进程
    name[2] = KERN_PROC_PID;//传递的餐数是进行的PID(进程ID)
    name[3] = getpid();//PID的值告诉它
    
    struct kinfo_proc info;//接受信息的结构体
    size_t info_size = sizeof(info);//结构体的大小
    
    //接下来开始检查
    /*
     1.查询信息数组
     2.数组中数据类型的大小
     3.接受信息结构体的指针
     4.接受信息结构体的大小的指针
     */
    int error = sysctl(name, sizeof(name)/sizeof(*name), &info, &info_size, 0, 0);
    assert(error == 0);//0 就是没错误.其他就是错误码
    
    return ((info.kp_proc.p_flag & P_TRACED) != 0);
}


static void antiDebugFunc(){
    if (isDebugger()) {
        NSLog(@"进程被调试!!");
    }
    //开启反调试
    ptrace(PT_DENY_ATTACH, getpid(), 0, 0);
}

+(void)load
{
    antiDebugFunc();
}


@end
