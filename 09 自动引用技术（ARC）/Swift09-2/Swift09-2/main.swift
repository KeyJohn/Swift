//
//  main.swift
//  Swift09-2
//
//  Created by keyzhang on 15/7/13.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

var teacher: Teacher? = Teacher(name: "张三") //初始化T->ARC+1
var student: Student? = Student(name: "李四", teacher: teacher!) //初始化S->ARC+1

teacher!.student = student  //T中的S->ARC+1
//student!.teacher = teacher  //S中的T->ARC+1


teacher = nil   //T->ARC-1,但不等于0,造成内存泄漏
student = nil   //S->ARC-1,但不等于0,造成内存泄漏


/*解决方法： 
    将Teacher中的student对象设成弱引用，或者将Student中的teacher对象设成弱引用

    或者设为无主引用！使用关键字unowned
*/