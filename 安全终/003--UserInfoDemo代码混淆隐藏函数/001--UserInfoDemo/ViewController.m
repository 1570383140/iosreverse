//
//  ViewController.m
//  001--UserInfoDemo
//
//  Created by H on 2018/6/13.
//  Copyright © 2018年 H. All rights reserved.
//  

#import "ViewController.h"
#import "UserInfo.h"
#import "EncryptionTools.h"

@interface ViewController ()

@end

//NSString * const AES_KEY = @"IUKDSIEKD";


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

//采用^运算直接换算成结果.不会进入字符串常量区
#define STRING_ENCRYPT_KEY 0xAC
static NSString * AES_KEY(){
    unsigned char key[] = {
        (STRING_ENCRYPT_KEY ^ 'I'),
        (STRING_ENCRYPT_KEY ^ 'U'),
        (STRING_ENCRYPT_KEY ^ 'I'),
        (STRING_ENCRYPT_KEY ^ 'D'),
        (STRING_ENCRYPT_KEY ^ 'I'),
        (STRING_ENCRYPT_KEY ^ 'S'),
        (STRING_ENCRYPT_KEY ^ 'T'),
        (STRING_ENCRYPT_KEY ^ 'P'),
        (STRING_ENCRYPT_KEY ^ '#'),
        (STRING_ENCRYPT_KEY ^ '\0')
    };
    unsigned char * p = key;
    while (((*p) ^=  STRING_ENCRYPT_KEY) != '\0') p++;
    
   return [NSString stringWithUTF8String:(const char *)key];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UserInfoClass * user = [[UserInfoClass alloc] init];
    if ([user isVipWithAccount:@"hank"]) {
        
       NSString * str = [[EncryptionToolsClass sharedEncryptionTools] encryptString:@"some message want to encrypted" keyString:AES_KEY() iv:nil];
        [user sendWithUserInfo:str];
        NSLog(@"是VIP");
    }else{
        NSLog(@"不是VIP");
    }
}


@end
