//
//  main.swift
//  Swift07-2
//
//  Created by keyzhang on 15/7/11.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

/****************扩展*************/
//概念：向已有类、结构体、枚举添加新功能

extension Double {
    func printMyDouble() {
        print(self+1)
    }
}

var d = 1.1
d.printMyDouble()

//扩展属性-----注意：不能添加存储属性(没有属性观察器)
extension Double {
//    var cm: Double = 0.0  //错误
    var cm: Double {
        return self / 100
    }
    var km: Double {
        return self * 1000
    }
    var m: Double {
        return self
    }
    
}

print("\(d.cm)--\(d.km.km)--\(d.m)")

//扩展构造器
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

//默认构造器
let defaultRect = Rect()

//成员构造器
let memberwiseRect = Rect(origin: Point(x: 100, y: 100), size: Size(width: 50, height: 50))


//向整型数据扩展一个求立方的方法
extension Int {
    func cubedInt() -> Int {
        return self * self * self
    }
}

print(4.cubedInt())


//修改实例方法
//通过扩展添加的实例方法也可以修改实例方法本省
//注意：结构体和枚举中修改self或其属性方法必须使用关键字mutating标记实例方法
extension Int {
    mutating func square(){
        self = self * self
    }
}

var a = 100
a.square()
print(a)

//扩展下标脚本
//使用sbuscript关键字添加新下标

//通过下标寻找数字从右到左的第n个数字
extension Int {
    subscript(index: Int) -> Int {
        var decimal = 1
        if index > 0 {
            for _ in 1...index {
                decimal *= 10
            }
        }
        return (self / decimal) % 10
    }
}
print(1235456789[0])


//扩展嵌套类型
extension String {
    enum Biological {
        case Plants, Animals, Microbes, Unknown
    }
    
    var biological: Biological {
        switch String(self).lowercaseString {
        case "rose", "moly", "orchid":
            return .Plants
        case "horse", "ox", "sheep", "deer":
            return .Animals
        case "Becteria", "Fungus", "Viruses":
            return .Microbes
        default:
            return .Unknown
        }
    }
}

//将枚举类型和String值联合使用
func printStringKinds(word: String) {
    switch word.biological {
    case .Plants:
        print("Plants")
    case .Animals:
        print("Animals")
    case .Microbes:
        print("Microbes")
    case .Unknown:
        print("Unknown")
    }
}


printStringKinds("ox")




