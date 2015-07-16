//
//  AppDelegate.swift
//  Swift10-1
//
//  Created by keyzhang on 15/7/16.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var thread1: NSThread?
    var thread2: NSThread?
    
    //定义两个线程条件
    let conditional1: NSCondition = NSCondition()
    let conditional2: NSCondition = NSCondition()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //第一种方式创建线程
//        let thread: NSThread = NSThread(target: self, selector: "run", object: nil)
//        //手动开启
//        thread.start()
        
        //第二种方式创建
//        NSThread.detachNewThreadSelector("run", toTarget: self, withObject: nil)
        
        //线程同步通过锁来实现，每个线程都只有一个锁
        thread1 = NSThread(target: self, selector: "run", object: nil)
        thread2 = NSThread(target: self, selector: "run1", object: nil)
        
        thread1!.start()
        
        //第三种方式
        //    初始化一个操作/队列或者线程池
        
//        NSOperationQueue *queue = [NSOperationQueue currentQueue];

//        for index in 0...100 {
//            print("主线程---\(index)")
//        }
        
        
        
        
        
        return true
    }
    
    
    func run() {
        for index in 0...100 {
            print("run线程---\(index)")
            
            if index == 5 {
                //启动线程2
                thread2!.start()
                
                //线程1锁定
                conditional1.lock()
                conditional1.wait()
                conditional1.unlock()

            }
            
        }
        
        //激活线程2
        conditional2.signal()
    }
    
    func run1() {
        for index in 0...100 {
            print("run1线程---\(index)")
            
            if index == 9 {
                //激活线程1
                conditional1.signal()
                
                //锁定线程2
                conditional2.lock()
                conditional2.wait()
                conditional2.unlock()
            }
        }
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

