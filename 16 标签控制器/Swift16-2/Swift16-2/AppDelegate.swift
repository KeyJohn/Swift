//
//  AppDelegate.swift
//  Swift16-2
//
//  Created by keyzhang on 15/8/9.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //初始化window， 大小为设备物理大小
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //把window的背景颜色改成白色
        self.window?.backgroundColor = UIColor.whiteColor()
        //让window作为主window显示
        self.window?.makeKeyAndVisible()
        
        /*-----------------初始化Tabbar控制器--------------*/
        let home = UIViewController()
        let message = UIViewController()
        let search = UIViewController()
        let setting = UIViewController()
        let viewControllers = [home, message, search, setting]
        
        let tabbarCtrl = UITabBarController()
        tabbarCtrl.viewControllers = viewControllers
        self.window?.rootViewController = tabbarCtrl
        
        //创建UITabBarItem
        
        //使用系统的样式创建
        let tabItem1 = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Favorites, tag: 1)
        home.tabBarItem = tabItem1
        
        let tabItem2 = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 1)
        message.tabBarItem = tabItem2
        
        //使用自定义的图片、标题
        let tabItem3 = UITabBarItem(title: "搜索", image: UIImage(named: "tabbar_discover_highlighted.png"), tag: 1)
        search.tabBarItem = tabItem3
        
        let tabItem4 = UITabBarItem(title: "设置", image: UIImage(named: "tabbar_profile_highlighted.png"), tag: 1)
        setting.tabBarItem = tabItem4
        
        /*------------------设置tabbar工具栏------------------*/
        let tabbar = tabbarCtrl.tabBar
        
        //设置tabBar的背景图片
        var img = UIImage(named: "navbg.png")
        UIGraphicsBeginImageContext(CGSizeMake(width, 49))
        img?.drawInRect(CGRectMake(0, 0, width, 49))
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tabbar.backgroundImage = img
        //设置tabBar的选中图片颜色
        tabbar.tintColor = UIColor.redColor()
        
        //设置选中item后，盖在此item上的图片
        tabbar.selectionIndicatorImage = UIImage(named: "选中.png")
        
        //为item是指一个小图标
        tabItem1.badgeValue = "New";

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

