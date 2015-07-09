//
//  main.swift
//  Swift06-1
//
//  Created by keyzhang on 15/7/8.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//初始化是类、结构体、枚举类型实例化的准备阶段
//Swift的构造器没有返回值

//存储属性的初始化---》存储属性不能为不确定状态
struct Person {
    
    //标准写法
//    var name: String
//    init() {
//        name = "John"
//    }
    //简洁写法
    var name = "John"
    
}


//自定义初始化
struct Dog {
    var name = "", age = 0
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}


var ps = Person()
print(ps.name)

var dog = Dog(name: "Kiti", age: 4)
print(dog)


//类的继承和初始化
var base = Base(name: "base")

//注意初始化的顺序
var sub = Subclass(name: base.name!, age: 6)
print("\(sub.name!), \(sub.age!)")


//反初始化
base = Base(name: "OtherBase")

//注意打印的顺序
sub = Subclass(name: base.name!, age: 16)
print("\(sub.name!), \(sub.age!)")




