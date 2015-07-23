//
//  AppDelegate.swift
//  Swift12-2
//
//  Created by keyzhang on 15/7/23.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var statusWindow: UIWindow?

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
        
        
        //01、创建一个UIWindow，添加到状态拦的上面去显示
        let bounds = UIScreen.mainScreen().bounds
        let width = bounds.size.width
        statusWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        statusWindow?.backgroundColor = UIColor.blueColor();
        statusWindow?.windowLevel = UIWindowLevelAlert
        statusWindow?.hidden = false
        
        let statuseVC: ViewController! = ViewController()
        statusWindow?.rootViewController = statuseVC

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.cyanColor()
        label.backgroundColor = UIColor.clearColor()
        label.text = "这是自定义的Window"
        //将label添加到view上或者window上是一样的效果,弄清楚层级关系
        statuseVC.view.addSubview(label)
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

