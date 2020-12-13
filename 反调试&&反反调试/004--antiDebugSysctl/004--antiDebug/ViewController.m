//
//  ViewController.m
//  004--antiDebug
//
//  Created by H on 2018/6/8.
//  Copyright © 2018年 H. All rights reserved.
//

#import "ViewController.h"
#import <sys/sysctl.h>



@interface ViewController ()

@end

@implementation ViewController

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

static dispatch_source_t timer;

void debugCheck(){
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (isDebugger()) {
            NSLog(@"检测到了!!");
        }else{
            NSLog(@"正常!!");
        }
    });
    dispatch_resume(timer);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    debugCheck();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
