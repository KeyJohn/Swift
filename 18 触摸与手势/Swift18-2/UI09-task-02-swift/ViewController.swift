//
//  ViewController.swift
//  UI09-task-02-swift
//
//  Created by keyzhang on 15/4/10.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //开始摇动设备
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("motionBegan")
    }
    
    //摇动结束
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        print("motionEnded")
    }


}

