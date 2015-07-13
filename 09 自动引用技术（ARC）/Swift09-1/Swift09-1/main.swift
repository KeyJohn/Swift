//
//  main.swift
//  Swift09-1
//
//  Created by keyzhang on 15/7/13.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//ARC---> Automatic Refrerence Counting,自动管理内存
//类对象的指针被引用时计数+1，被释放时-1，如果为0则自动释放
//类的对象一旦被ARC释放，则该对象不能再被使用

//Swift使用ARC来管理应用程序的内存使用。大多数情况下，我们并不需要考虑内存的管理，当实例不在需要时，ARC会自动释放这些实例所使用的内存

class Example{
    let name: String?
    init(na: String){
        self.name = na
        print("\(self.name!) 被初始化")
    }
    
    deinit {
        print("\(self.name!) 被反初始化")
    }
}

var ex1: Example?
var ex2: Example?
var ex3: Example?

//创建对象
ex1 = Example(na: "A")  //ARC+1
ex2 = ex1   //ARC+1
ex3 = ex1   //ARC+1

ex1 = nil   //ARC-1
ex2 = nil   //ARC-1
ex3 = nil   //ARC-1,当执行此代码时,引用计数为0,调用反初始化方法










