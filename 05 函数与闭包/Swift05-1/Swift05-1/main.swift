//
//  main.swift
//  Swift05-1
//
//  Created by keyzhang on 15/7/7.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//func  函数名（ 参数变量：类型 ，参数变量：类型...）｛｝

//一个简单的求和函数
//函数类型(int, int)->(int)
//如果没有指定形参是否可变，则默认是常量
func add(var a: Int, b: Int) -> Int {
    a = 1
    return a + b
}

//
//函数类型(int, int, int)->(int), a,b,c为常量
func add(a: Int, b: Int, c: Int) -> Int {
    return a + b + c
}

//参数添加默认值
//func printString(string: String = "hehe") {
//    print(string)
//}


//参数可变
func printString(strings: String...) {
    for string in strings {
        print(string)
    }
}

//函数类型做参数
func add(addFun: (Int, Int, Int) -> Int, a: Int, b: Int) {
    print(addFun(a, b, 50))
}

//函数类型做返回值

func minus(a: Int, b: Int) -> Int {
    return a - b
}

enum FunctionType {
    case Add
    case Minus
}

func chooseFuntion(funType: FunctionType) -> (Int, Int) -> Int {
    
    return funType == FunctionType.Add ? add : minus
}


//函数的嵌套
func mainFunction(input: Int) -> Int {
    func internalFunction(input: Int) -> Int {
        return input - 1
    }
    
    return internalFunction(input - 1)
}



//函数的调用
var a = 10, b = 20;

print(add(a, b: b))

print(add(a, b: b, c: 10))

printString("haha","hehe")
printString()

add(add, a: a, b: b)

let fun = chooseFuntion(FunctionType.Minus)
print(fun(a, b))

print(mainFunction(10))
