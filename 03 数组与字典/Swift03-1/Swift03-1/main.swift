//
//  main.swift
//  Swift03-1
//
//  Created by keyzhang on 15/7/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation


/*---------------------数组-------------------------*/
//数组的创建与初始化
print("------数组--------")

var someInts = [Int]()
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
//var teachers: [String] = ["Mr.Zhang", "Mr.Li"]
var teachers = ["Mr.Zhang", "Mr.Li"]

//数组的常见操作
var arrayCount = teachers.count
print("有\(arrayCount)位老师")

//判断值是否为空
if teachers.isEmpty {
    print("empty")
}else {
    print("not empty")
}

//添加数据
teachers.append("Mr.Wang")
teachers += ["Mr.Liu"]
teachers += ["Jack", "Rose"]

teachers.insert("John", atIndex: 0)


//删除数据
var first = teachers.removeAtIndex(0)
var last = teachers.removeLast()
print(first+last)
//teachers.removeAll()

//修改数据
var firstItem = teachers[0]
firstItem = "Jay"
teachers[1...3] = ["Bob"] //注意，这也是可行的，需要注意防止数组越界


print("--------------")

//遍历数组
for item in teachers {
    print(item)
}

for (index, item) in teachers.enumerate() {
    print("\(item):\(index)")
}


print("------字典--------")

/*---------------------字典-------------------------*/
//字典的创建和初始化
var someDic = [:]  //空字典
//var language: Dictionary<String, String> = ["English":"en", "Chinese":"ch"]
var language = ["English":"en", "Chinese":"ch"]


//字典的常见操作
var dicCount = language.count
print("有\(dicCount)种语言")

//修改数据
language["French"] = "fr"   //如果不存在则添加
language["French"] = "fr1"  //如果存在则修改

var frItem = language.updateValue("Fr", forKey: "French")
print(frItem)   //如果有值则返回修改前的值

var geItem = language.updateValue("Ge", forKey: "German")
print(geItem)   //没有则返回空


//移除数据
language["English"] = nil

//如果有值则返回移除前的值，没有的话返回空
let removedValue = language.removeValueForKey("English")
print(removedValue)

print("--------------")
//遍历字典

//元组遍历
for (key, value) in language {
    print("\(key): \(value)")
}

print("--------------")

//遍历key
for key in language.keys {
    print(key)
}

print("--------------")

//遍历value
for key in language.values {
    print(key)
}



















