//
//  ViewController.m
//  003--基本防护
//
//  Created by H on 2018/5/11.
//  Copyright © 2018年 H. All rights reserved.
//  自己的Method Swizzle 保留!! 外面注入的HOOK失效!!

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

+(void)load{
    NSLog(@"ViewController--Load");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)btnClick1:(id)sender{
    NSLog(@"按钮1调用了!!");
}

-(IBAction)btnClick2:(id)sender{
    NSLog(@"按钮2调用了!!");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
