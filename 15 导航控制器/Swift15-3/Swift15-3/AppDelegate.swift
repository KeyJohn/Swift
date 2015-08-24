//
//  AppDelegate.swift
//  Swift15-3
//
//  Created by keyzhang on 15/8/6.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //初始化window， 大小为设备物理大小
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //把window的背景颜色改成白色
        self.window?.backgroundColor = UIColor.whiteColor()
        //让window作为主window显示
        self.window?.makeKeyAndVisible()
        
        //创建一个导航控制器,并且将一个控制器作为导航控制器的根视图控制器(第一个子控制器)
        let rootVC = RootViewController()
        
        let nav = UINavigationController(rootViewController: rootVC)
        
        self.window!.rootViewController = nav;
        
        
        return true
    }

    


}

