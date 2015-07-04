//
//  main.swift
//  Swift04-2
//
//  Created by keyzhang on 15/7/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

var dog = Dog()

//实例方法
dog.printGood()
dog.printWithString("Bad")
print(dog.sum(10, b: 20))


//类方法
var (_, _, sum) = Dog.classMethod(20, b: 30)
print(sum)


//下标脚本
dog[0] = 100
dog[1] = 200
print(dog[0])
print(dog[1])
