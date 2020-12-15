//
//  NSObject+Codesign.h
//  004--防重签名
//
//  Created by H on 2018/6/12.
//  Copyright © 2018年 H. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Codesign)
//检测TeamID
void  checkCodesign(NSString *id);

@end
