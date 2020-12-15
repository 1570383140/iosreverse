//
//  ViewController.m
//  004--重签名防护
//
//  Created by H on 2018/6/13.
//  Copyright © 2018年 H. All rights reserved.
//  5KN6964MFR

#import "ViewController.h"
#import "NSObject+Codesign.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    checkCodesign(@"5KN6964MFR");
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
