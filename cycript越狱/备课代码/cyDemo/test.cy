(function(exports) {

    APPID = [NSBundle mainBundle].bundleIdentifier,
    APPPATH = [NSBundle mainBundle].bundlePath,
    APPHOME = NSHomeDirectory(),
    APPDOC = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0],
    APPLIBRARY = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0],
    APPCACHE = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]


	HKRootVC = function(){
		return UIApp.keyWindow.rootViewController;
	};
	HKKeyWindow = function(){
		return UIApp.keyWindow;
	};
	

	HKGetCurrentVCFromRootVc = function(rootVC){
		var currentVC;
		if ([rootVC presentedViewController]) {
	        // 视图是被presented出来的
	        rootVC = [rootVC presentedViewController];
	    }
			if ([rootVC isKindOfClass:[UITabBarController class]]) {
	        // 根视图为UITabBarController
	        currentVC = HKGetCurrentVCFromRootVc(rootVC.selectedViewController);
			} else if ([rootVC isKindOfClass:[UINavigationController class]]){
	        // 根视图为UINavigationController
	   		 currentVC = HKGetCurrentVCFromRootVc(rootVC.visibleViewController);
	    } else {
	        // 根视图为非导航类
	        currentVC = rootVC;
	    }
			return currentVC;
	};

	HKCurrentVC = function(){
		return HKGetCurrentVCFromRootVc(HKRootVC());
	}
})(exports);





