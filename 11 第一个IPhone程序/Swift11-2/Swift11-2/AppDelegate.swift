//
//  AppDelegate.swift
//  Swift11-2
//
//  Created by keyzhang on 15/7/18.
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
        
        //主window必须有一个根视图控制器，不然程序会崩溃
        let firstVC: ViewController! = ViewController()
        self.window?.rootViewController = firstVC

        return true
    }

    //程序即将进入非活动状态
    /*
    1.进入后台
    2.锁屏
    3.电话拨入
    */
    //程序启动的时候调用此协议方法
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    //程序已经进入到后台调用的协议方法
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    //即将从后台回到前台
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    //程序已经激活
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    //程序退出的时候调用
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

