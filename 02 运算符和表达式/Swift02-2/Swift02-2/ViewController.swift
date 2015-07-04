//
//  ViewController.swift
//  Swift02-2
//
//  Created by keyzhang on 15/6/26.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //99乘法表
        for i in 1...9 {
            for j in 1...i {
//                print("\(j) * \(i) = \(i*j)")
                print("\(j) * \(i) = \(i*j)  ", appendNewline: false)
            }
            print("")
        }
        
        //while循环
        var index = 0
        while index < 10 {
            print(index)
            index++
        }
        
        print("")
        index = 0
        //repeat-while循环
        repeat {
            print(index)
            index++
        }while (index < 10)
        
        
        //if语句
        var f = true
        if f {
            print(f)
            f = !f
        }else {
            print(f)
        }
        
        //switch语句
        let s1 = 5_000
        switch s1 {
        case 1000:
            print(1000)
            fallthrough
        case 5000:
            print(5000)
            fallthrough
        case 6000:
            break
            print(6000)
        case 3000...6000:
            print("5000 too")
        default:
            print("default")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

