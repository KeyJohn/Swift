//
//  main.swift
//  Swift10-6
//
//  Created by keyzhang on 15/7/17.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation
/*
/****************dispatch_group的使用****************/
let group:dispatch_group_t = dispatch_group_create()

//异步添加事件，所有任务执行顺序是随机的
dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
    sleep(2)
    print("block1")
}
dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
    print("block2")
}
dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
    print("block3")
}
//结果汇总
//dispatch_group_notify对结果的汇总不阻塞当前的线程。 不推荐使用
//dispatch_group_notify(group, dispatch_get_main_queue()) { () -> Void in
//    print("end")
//}

//对block中的事件永久等待
//dispatch_group_wait(group, DISPATCH_TIME_FOREVER)

//等待指定时间
let time: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC))
var result = dispatch_group_wait(group, time)
if result == 0 {
    print("All task over")
}else {
    print("Tasking")
}

print("code end")
*/


/*
/**********************dispatch_apply高效遍历**********************/
let arr:Array = [0, 1, 2, 3, 4, 5]
/*
iterations: 遍历执行的次数
queue: 执行操作所在的队列
block: 执行的任务

func dispatch_apply(iterations: Int, _ queue: dispatch_queue_t!, _ block: (Int) -> Void)
*/
//dispatch_apply执行的效率比一般for循环执行的效率要高
dispatch_apply(arr.count, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { (index) -> Void in
    print("\(arr[index])")
    
    //执行更新
    dispatch_async(dispatch_get_main_queue(), { () -> Void in
        print("end---\(index)")
    })
}
*/


/**********************信号量使用**********************/

//dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

//创建一个信号量
let semaphore: dispatch_semaphore_t = dispatch_semaphore_create(1)
let queue: dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
var array = [Int]()
for index in 0..<100000 {
    dispatch_async(queue, { () -> Void in
        //等待，等待条件：如果信号量>0,则不需要等待直接往下执行，反之则等待
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        array.append(index)
        //发信号，使原来的信号计数值 + 1
        dispatch_semaphore_signal(semaphore)
    })
}
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
    print("array.count = \(array.count)")
    let set = Set(array)
    print("set.count = \(set.count)")
})

NSRunLoop.currentRunLoop().run()

