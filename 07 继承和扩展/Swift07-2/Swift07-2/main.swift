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

print("\(d.cm)--\(d.km)--\(d.m)")

//扩展构造器


