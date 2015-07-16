//
//  main.swift
//  Swift10-3
//
//  Created by keyzhang on 15/7/16.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation


var sd1 = SingleDemo.shareSingleDemo
sd1.name = "haha"

/***********************GCD********************************/

//单例测试
var sd2 = SingleDemo.shareSingleDemo
print("\(sd2.name!)")



//创建一个Serial Dispatch Queue
var serialqueue: dispatch_queue_t = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL)

//创建一个Concurrent Dispatch Queue
var concurrentqueue: dispatch_queue_t = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT)

//获取系统的主线程队列
var queue: dispatch_queue_t = dispatch_get_main_queue()

//创建的默认的异步线程队列
var globalQueue: dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

//同步添加
//造成死锁1
//在主线程队列中添加了一个任务,因为是同步添加，所以需要等到任务执行完了才能继续往下走
//但是新添加的任务排在队列的末尾，要执行队列中的任务必须要等到添加任务完成了以后，才能执行输出任务。因此程序卡死，不能输出end
//print("Begin")
//dispatch_sync(queue) { () -> Void in
//    print("sync1")
//}
//print("end")

//死锁2
//外层 在主线程中添加一个任务，以为是异步，所以不需要等待添加任何任务执行完，因此能够输出end

//里层 用同步添加的任务到主线程队列，因此又回到了死锁1，因此程序卡死 不能输出sync2
//结论：永远也不要在主线程中同步添加事件
print("begin")
dispatch_async(queue) { () -> Void in
    print("sync1")
    dispatch_sync(queue, { () -> Void in
        print("sync2")
    })
}
sleep(2)
print("end")

NSRunLoop.currentRunLoop().run()






