//
//  Subclass.swift
//  Swift06-1
//
//  Created by keyzhang on 15/7/8.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Cocoa

class Subclass: Base {
    var age:Int?
    init(name:String, age: Int) {
        super.init(name: name)
        self.age = age
    }
    
    //反初始化---》实例在被释放之前，反初始化函数立即调用
    deinit {
        print("SubClass - deinit")
    }
    

}
