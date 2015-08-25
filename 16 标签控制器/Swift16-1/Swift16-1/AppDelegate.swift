//
//  AppDelegate.swift
//  Swift16-1
//
//  Created by keyzhang on 15/8/8.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //初始化window， 大小为设备物理大小
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //把window的背景颜色改成白色
        self.window?.backgroundColor = UIColor.whiteColor()
        //让window作为主window显示
        self.window?.makeKeyAndVisible()
        
        let homeVC = HomeViewController()
        let messageVC = MessageViewController()
        let searchVC = SearchViewController()
        let settingVC = SettingViewController()
        
        
        var viewControllers = [homeVC, messageVC, searchVC, settingVC]
        
        for index in 0...4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(red: CGFloat(CGFloat(arc4random()) % 255 / 255), green: CGFloat(CGFloat(arc4random()) % 255 / 255), blue: CGFloat(CGFloat(arc4random()) % 255 / 255), alpha: 1)
            vc.title = "控制器\(index)"
            viewControllers.append(vc)
        }
        
        //创建一个标签控制器
        let tabVC = UITabBarController()
        //设置代理
        tabVC.delegate = self
        //设置标签控制器管理的子控制器
        tabVC.viewControllers = viewControllers
        self.window?.rootViewController = tabVC
        
        return true
    }
    
    //MARK: UITabBarControllerDelegate
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        print(viewController)
    }

 

}

