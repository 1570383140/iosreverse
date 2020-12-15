//
//  UserInfo.m
//  001--UserInfoDemo
//
//  Created by H on 2018/6/13.
//  Copyright © 2018年 H. All rights reserved.
//  检测是否是越狱状态的!!

#import "UserInfo.h"
#import "EncryptionTools.h"


@implementation UserInfoClass

-(BOOL)isVipWithAccount:(NSString *)account{
    
    if ([account isEqualToString:@"hank"]) {
        return YES;
    }
    return NO;
    
}

//给服务器发敏感信息
-(void)sendWithUserInfo:(NSString *)info
{   
    NSLog(@"发送的是:%@",info);
    
}


@end
