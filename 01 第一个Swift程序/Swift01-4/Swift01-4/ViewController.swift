//
//  ViewController.swift
//  Swift01-4
//
//  Created by keyzhang on 15/6/21.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //字符
        //在swift中，字符和字符串都用 双引号“”括起来，要想将变量定义成字符型，必须指定类型
        let char : Character = "a"  //char是字符
        let char1 = "a"   //char1 是字符串
        //如果赋值语句右边是一个字符类型数据，则变量默认是字符类型
        let char2 = char  //char2是字符
        
        //字符串
        //字符串的初始化
        let string = "abc"
        let string1 = String("abc")
        
        //通过for循环来枚举每一个字符
        for c : Character in string1.characters {
            print(c)
        }
        
        
        //元组类型
        //元组是包含多个值的类型，将多个值组合为单个值
        //元组中的值可以是任意类型,而且每个元组中的类型不必要相同
        let tuples = (111, 222, "abc", "d")
//        println(tuples)
        print(tuples)
        
        let tuples1 = tuples
//        println(tuples1)
        print(tuples1)
        
        //可以使用下划线 “_” 进行占位
        let (_, a, _, _) = tuples
//        println("\(a)")
        print(a)
        
        //元组的用法
        let tuples2 = (name: "hehe", age: 20)
//        println(tuples2.name)
        print(tuples2)
        
        //可选类型
        //可选类型是用来解决对象变量或常量为空的情况
        //可选类型后加“?”代表允许变量没有值，并设为nil
        
        //对于一个可选变量，使用前通常做判断
        var b : String?
        print("b is \(b)")
        
        b = "abc"
        if b != nil {
            print("b is \(b)")
        }
        
        //每次使用可选变量前都先判断是否为空，这很麻烦
        //"!"用来确定可选变量一定有值
        var c : String?
        c = "123"
        print("c is \(c!)")

        var d : Int!
        d = Int(c!)
        
        d! += 1;
        
        print("d is \(d)")
        
        
        //数值的可读性
        //"_"用来分隔较大的数值
        let value1 = 10_000_000_000   //更方便看出来是100亿
        
        
        //类型别名(typealias)
        typealias NewInt = Int
        let new_value:NewInt = 123
        print(new_value)
        
        //基本数据类型转换
        //int转double、float、string
        let j = 3
        let dj = Double(j)
        let fj = Float(j)
        let sj = String(j)
        print("\(j),\(dj),\(fj),\(sj)")
        
        //string转int、double、float
        let s = "1234.5"
        let iS = Int(s)//字符串内容必须是整形才能用此方法
        let ns = s as NSString
        let iS1 = ns.integerValue
        let ds = ns.doubleValue
        let fs = ns.floatValue
        
        
        print("\(iS),\(iS1),\(ds),\(fs)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

