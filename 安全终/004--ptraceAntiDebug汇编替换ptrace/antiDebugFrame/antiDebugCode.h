//
//  antiDebugCode.h
//  antiDebugFrame
//
//  Created by H on 2018/6/13.
//  Copyright © 2018年 H. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface antiDebugCode : NSObject


+ (void)load{
    //防不住断点调试
//    ptrace(PT_DENY_ATTACH,0,0,0);
}
@end
