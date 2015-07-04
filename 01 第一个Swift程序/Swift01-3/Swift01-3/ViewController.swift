//
//  ViewController.swift
//  Swift01-3
//
//  Created by keyzhang on 15/6/21.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

//给浮点型写一个延展
extension Double {
    //转换
    func format(f: String) -> NSString {
        return NSString(format: "%\(f)f", self)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1、变量和常量
        
        //常量(let)---特殊的变量，设置一次值就不允许修改
        let a = 10
//        a++   //error
        
        
        //变量
        //如果没有指定变量的类型，编译器会根据变量初始化时右侧表达式推导出当前变量类型-----此时，变量必须要进行初始化
//        var count1  //error 必须初始化
        var count1 = 10
//        println(count1)
        print(count1)
        
        //通过 ':' 指定变量的类型
        var count2 : Int  //合法
//        let countL2 : Int //注意，如果是常量,必须初始化
        count2 = 20   //即使在声明时合法了，但是在使用的时候一定要初始化
//        println(count2)
        print(count2)
        
        //注意：不管是变量还是常量，一旦确定了数据类型，后期是不可以改变的
        
        
        
        //2、基本数据类型
        //整形
//        let minIntValue = Int32.min
//        let maxIntValue = Int8.max
//        println(minIntValue,maxIntValue)
        //通常开发中不需要选择位数，直接用Int。它和当前机器环境的字长数相同
        
        
        //浮点型
        let f1 : Double = 1.00123456789
        let f2 : Float = 1.00123456789
//        println(f1.format(".1"))
        print(f1.format(".1"))
//        println(f1)
//        println(f2)
        print(f1)
        print(f2)
        
        //布尔类型
        //只能是真或假
        
        let true1 = true
        let false1 = false
        
        if !true1 {
//            println(true1, "\(false1)")
            print(true1, "\(false1)")
        }else {
//            println("\(true1)", false1)
            print("\(true1), false1")

        }
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

