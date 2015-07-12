//
//  main.swift
//  Swift08-1
//
//  Created by keyzhang on 15/7/12.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//协议是为一些方法、属性和其特定任务或功能定义了一套要求，它只是描述了实现会是什么样子，并不提供这些要求的实现。
//协议能够被类、枚举、结构体实现。

//定义一个协议,要求实现类必须实现读写属性readAndWite和只读属性onlyRead
protocol someProtocol {
    var readAndWite: Int {
        get
        set     //读写属性
    }
    
    var onlyRead: Int {
        get     //只读属性
    }
    
}

//定义一个协议,要求实现类必须实现只读静态属性classValue
protocol classProtocol {
    static var classValue: Int {
        get
    }
}

//定义一个结构体，遵循定义的协议
struct SomeStruct: someProtocol {
    var selfValue: Int = 0
    var readAndWite: Int {
        get {
            return 123
        }
        set {
            selfValue = newValue
        }
    }
    
    var onlyRead: Int {
        get {
            return 2015
        }
    }
    
    static var classValue: Int {
        get {
            return 2016
        }
    }
}

//定义一个类，遵循定义的协议
class SomeClass: NSObject, classProtocol {
    
    class var classValue: Int {
        get {
            return 1000
        }
    }
}

var someStruct = SomeStruct()
someStruct.readAndWite = 789
print(someStruct.readAndWite)
print(someStruct.selfValue)
print(someStruct.onlyRead)

print(SomeClass.classValue)





