//
//  AppDelegate.swift
//  Swift12-1
//
//  Created by keyzhang on 15/7/23.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var window2: UIWindow?
    
    var window3: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //初始化window， 大小为设备物理大小
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //把window的背景颜色改成白色
        self.window?.backgroundColor = UIColor.whiteColor()
        //让window作为主window显示
        /*
        1.让window在屏幕上直接显示出来
        2.让window作为主window，主window只有一个
        
        注意： window和普通的view不一样，window可以直接显示，不需要添加到父视图上去显示
        */
        self.window?.makeKeyAndVisible()
        print(self.window)
        print(UIApplication.sharedApplication().keyWindow)
        

        //window必须有一个根视图控制器，不然程序会崩溃
        let firstVC: ViewController! = ViewController()
        self.window?.rootViewController = firstVC
        
        //window的等级
        //    UIWindowLevelAlert> UIWindowLevelStatusBar > UIWindowLevelNormal
        
        self.window2 = UIWindow(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        window2?.windowLevel = UIWindowLevelStatusBar
        window2?.backgroundColor = UIColor.redColor()
        //hidden的作用，隐藏，  window的这一属性默认为yes，比较特殊
        window2?.hidden = false
        //window必须有一个根视图控制器，不然程序会崩溃
        let secondVC: ViewController! = ViewController()
        window2?.rootViewController = secondVC;
        
        self.window3 = UIWindow(frame: CGRect(x: 20, y: 50, width: 100, height: 100))
        window3?.windowLevel = UIWindowLevelNormal
        window3?.backgroundColor = UIColor.yellowColor()
        window3?.hidden = false
        //window必须有一个根视图控制器，不然程序会崩溃
        let thirdVC: ViewController! = ViewController()
        window3?.rootViewController = thirdVC;

        //    UIScreen: 屏幕, 是一个单例,因为只有一个屏幕
        let screen = UIScreen.mainScreen()
        let bounds = screen.bounds
        print("width is \(bounds.size.width), height is \(bounds.size.height)")
        
        
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

