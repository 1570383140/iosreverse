//IIFE 匿名函数自执行表达式

// (function(exports){



	APPID = [NSBundle mainBundle].bundleIdentifier;
	APPPATH = [NSBundle mainBundle].bundlePath;



	//如果有变化,就用function去定义!!
	HKRootvc = function(){
		return UIApp.keyWindow.rootViewController;
	};


	HKKeyWindow = function(){
		return UIApp.keyWindow;
	};
	


	HKGetCurrentVCFromRootVc = function(rootVC){
		var currentVC;
		if([rootVC presentedViewController]){
			rootVC = [rootVC presentedViewController];
		}

		if([rootVC isKindOfClass:[UITabBarController class]]){
			currentVC = HKGetCurrentVCFromRootVc(rootVC.selectedViewController);
		}else if([rootVC isKindOfClass:[UINavigationController class]]){
			currentVC = HKGetCurrentVCFromRootVc(rootVC.visibleViewController);
		}else{
			currentVC = rootVC;
		}

		return currentVC;
	};


	HKCurrentVC = function(){
		return HKGetCurrentVCFromRootVc(HKRootvc());
	};

// })(exports);