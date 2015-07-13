//
//  Student.swift
//  Swift09-2
//
//  Created by keyzhang on 15/7/13.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Cocoa

class Student: NSObject {
    var sName: String
    //设为弱引用
//    weak var teacher: Teacher?   //老师对象，初始值为nil
    
    //设为无主引用
    unowned var teacher: Teacher   //老师对象，初始值为nil
    
    //无主引用不能设为可选型，所以必须要初始化
    init(name: String, teacher: Teacher) {
        sName = name
        self.teacher = teacher
        print("\(sName)实例初始化完成")
    }
    
    func getName() -> String {
        return sName
    }
    
    deinit {
        print("\(sName)实例反初始化完成")
    }

}
