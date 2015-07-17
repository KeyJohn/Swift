//
//  ViewController.swift
//  Swift10-5
//
//  Created by keyzhang on 15/7/17.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //GCD延迟调用
        //获取当前运行的时间
        let first: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        let time: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC))
        
        
        //延迟调用，注意dispatch_after并不是在指定时间后执行任务处理，而是在指定时间后把任务追加到 Dispatch Queue里面。所以会有少许延迟。
//        func dispatch_after(when: dispatch_time_t, _ queue: dispatch_queue_t, _ block: dispatch_block_t)
        /*
        dispatch_time_t: 什么时候执行延迟调用的代码
        queue: 执行的任务放入到哪个队列中
        block: 具体执行的任务
        */        
        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
            print("dispatch_after: \(CFAbsoluteTimeGetCurrent() - first)")
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

