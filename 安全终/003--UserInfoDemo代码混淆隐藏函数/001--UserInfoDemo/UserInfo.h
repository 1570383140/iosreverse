//
//  UserInfo.h
//  001--UserInfoDemo
//
//  Created by H on 2018/6/13.
//  Copyright © 2018年 H. All rights reserved.
//  对称 非对称 哈希
//

#import <Foundation/Foundation.h>

@interface UserInfoClass : NSObject

-(BOOL)isVipWithAccount:(NSString *)account;

//给服务器一些敏感信息
-(void)sendWithUserInfo:(NSString *)info;

@end
