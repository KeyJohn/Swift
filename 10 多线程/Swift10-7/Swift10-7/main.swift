//
//  main.swift
//  Swift10-7
//
//  Created by keyzhang on 15/7/17.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation


/**********多线程并发控制*****************/

let semaphore: dispatch_semaphore_t = dispatch_semaphore_create(4)

let group: dispatch_group_t = dispatch_group_create();

let queue: dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
var array = [Int]()
for index in 0..<10 {
//    dispatch_async(queue, { () -> Void in
//        //等待，等待条件：如果信号量>0,则不需要等待直接往下执行，反之则等待
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
//        
//        print(index)
//        sleep(1)
//        
//        //发信号，使原来的信号计数值 + 1
//        dispatch_semaphore_signal(semaphore)
//    })
    
    
    //使用group监听任务
    dispatch_group_async(group, queue, { () -> Void in
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        print(index)
        sleep(1)
        dispatch_semaphore_signal(semaphore)
    })
}

dispatch_group_wait(group, DISPATCH_TIME_FOREVER);

print("end")

NSRunLoop.currentRunLoop().run()

