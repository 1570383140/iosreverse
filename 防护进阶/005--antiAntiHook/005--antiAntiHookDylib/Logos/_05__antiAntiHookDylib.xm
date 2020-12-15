// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

@interface ViewController


@end

%hook ViewController

-(void)btnClick2:(id)arg1{
    
    NSLog(@"HOOK到了!!");
}

%end
