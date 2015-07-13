//
//  Teacher.swift
//  Swift09-2
//
//  Created by keyzhang on 15/7/13.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Cocoa

class Teacher: NSObject {
    var tName: String
    var student: Student?   //学生对象，初始值为nil
    
    init(name: String) {
        tName = name
        print("\(tName)实例初始化完成")
    }
    
    func getName() -> String {
        return tName
    }
    
    deinit {
        print("\(tName)实例反初始化完成")
    }
}
