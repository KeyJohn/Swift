//
//  Dog.swift
//  Swift04-2
//
//  Created by keyzhang on 15/7/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Cocoa

class Dog: NSObject {
    
    //方法就是定义在类中的函数,分为实力方法和类方法
    
    //实例方法
    func printGood(){   //不带参数
        print("Good")
    }
    
    func printWithString(string: String) {  //带一个参数
        print(string)
    }
    
    func sum(a: Int, b: Int) -> String {    //带两个参数，并且返回一个字符串
        return String(a+b)
    }
    
    //类方法
    //带两个参数，返回一个元组类型
    class func classMethod(a: Int, b: Int) -> (String, String, Int) {
        return (String(a), String(b), a+b)
    }
    
    
    var num:[Int] = Array(count: 10, repeatedValue: 0)
    
    //下标脚本
    //下标脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值
    subscript(index: Int) -> Int {
        get{
            return num[index]
        }
        set(newValue){
            num[index] = newValue
        }
    }
    

}
