//
//  ViewController.swift
//  Swift02-1
//
//  Created by keyzhang on 15/6/26.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //赋值运算符
        let a = 10
        var b = 20
        b = a
        
        if a == b {
            print("a == b")
        }
        
//        if a = b {        //编译报错
//            print("a == b")
//        }
        
        //数值运算
        let c1 = a + b
        let c2 = a - b
        let c3 = a * b
        let c4 = a / b
        
        print(c1, c2, c3, c4)
        
        //“+”可用于字符串的拼接
        let s1 = "abc", s2 = "def"
        let s3 = s1 + s2
        print(s3)
        
        //求余运算
        let y1 = Double(a) % (Double(b)+1.3)
        let y2 = (Double(b)+1.3) % Double(a)
        print(y1, y2)
        
        //自增、自减
        var z1 = 10.1
        z1++
        var z2 = z1++ + 10
        z1--
        let z3 = z1-- - --z2
        print("\(z1), \(z2), \(z3)")
        
        
        
        //复合赋值
        var f = 15.0
        f += 1.0
        print(f)
        
        //三目运算符
        var m = f == 16 ? 1 : 0
        print(m)
        
        //区间运算符
        for index in 1...10 {
            print(index)
        }
        
        for index in 1..<10 {
            print(index)
        }
        
        
        //逻辑运算
        let m1 = true
        let m2 = false
        
        if m1 && !m2 || m++ == 0 {
            print("yes")
        }
        print(m)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

