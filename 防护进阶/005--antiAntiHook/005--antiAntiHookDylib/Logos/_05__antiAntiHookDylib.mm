#line 1 "/Volumes/Hank/Hank工作/备课/安全攻防班/023--防护进阶/备课代码/005--antiAntiHook/005--antiAntiHookDylib/Logos/_05__antiAntiHookDylib.xm"


#import <UIKit/UIKit.h>

@interface ViewController


@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class ViewController; 
static void (*_logos_orig$_ungrouped$ViewController$btnClick2$)(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$ViewController$btnClick2$(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST, SEL, id); 

#line 10 "/Volumes/Hank/Hank工作/备课/安全攻防班/023--防护进阶/备课代码/005--antiAntiHook/005--antiAntiHookDylib/Logos/_05__antiAntiHookDylib.xm"


static void _logos_method$_ungrouped$ViewController$btnClick2$(_LOGOS_SELF_TYPE_NORMAL ViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
    
    NSLog(@"HOOK到了!!");
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$ViewController = objc_getClass("ViewController"); MSHookMessageEx(_logos_class$_ungrouped$ViewController, @selector(btnClick2:), (IMP)&_logos_method$_ungrouped$ViewController$btnClick2$, (IMP*)&_logos_orig$_ungrouped$ViewController$btnClick2$);} }
#line 18 "/Volumes/Hank/Hank工作/备课/安全攻防班/023--防护进阶/备课代码/005--antiAntiHook/005--antiAntiHookDylib/Logos/_05__antiAntiHookDylib.xm"
