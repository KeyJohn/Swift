//
//  main.swift
//  Swift04-1
//
//  Created by keyzhang on 15/7/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//实例化对象
var ps = Person()
let a = ps.a
var b = ps.b

ps.name = "rose"

//搞清楚下面的输出
print(b) //nil
print(ps.b!) //rose
print(ps.name)//jack


//调用类型属性
print(++Person.classValue)


//属性监视器
ps.age = 100

ps.age = 101





