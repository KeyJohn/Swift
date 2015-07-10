//
//  main.swift
//  Swift07-1
//
//  Created by keyzhang on 15/7/10.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//父类
class Base {
    var baseName: String
    var baseTag: Int
    
    func getBaseName() -> String {
        return baseName
    }
    
    init() {
        baseName = "Base Class"
        baseTag = 1
    }
}

//子类
class SubClass: Base {
    
    //重写属性
    override var baseName: String {
        get{
            return super.baseName + " override"
        }
        set{
            super.baseName = newValue
        }
    }
    
    //重写方法 ----一定要写override，不然会报错
    override func getBaseName() -> String {
        return "sub " + super.getBaseName()
    }
    
}

//简单的类的使用
var base = Base()
base.baseName = "Base"
base.baseTag = 2
print("\(base.getBaseName())---- \(base.baseTag)")

//继承
//因为继承了Base，所以拥有Base类的所有属性和方法
var sub = SubClass()
sub.baseName = "Sub"
sub.baseTag = 3
print("\(sub.getBaseName())---- \(sub.baseTag)")





    