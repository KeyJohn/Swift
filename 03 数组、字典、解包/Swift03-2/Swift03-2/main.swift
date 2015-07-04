//
//  main.swift
//  Swift03-2
//
//  Created by keyzhang on 15/7/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

/*
一个变量， 要么存在并且赋值，要么不存在
*/

/*
可选类型类似于Objective-C中指针的nil值，但是nil只对类(class)有用，指对象不存在，而Swift 的 nil 不是指针，它代表特定类型的值不存在。任何类型的可选类型都能赋值为 nil，而不仅限于对象类型。并且更安全。
*/

/*
1.Swift里面nil 不能用于非可选类型
2.如果代码中的常量或者变量需要适配值不存在的情况, 务必将它声明为恰当的可选类型("?")
3.如果定义的可选类型的对象不提供默认值, 该对象将自动设为nil
*/
var a:String? = "hehe"
//a = nil
//let isEmpty = a.hashValue   //错误，可选类型不能直接操作
let isEmpty = a?.hashValue
print(isEmpty)

/*
总结 ? 的使用场景
1.声明Optional变量
2.用在Optional值操作中,用来判断是否响应后面的操作
*/


//解包
/*
如果确定一个可选类型的对象的值一定存在，那么我们使用 ！进行解包获取它的值，或者使用Optional Binding。
*/

//强制解包
//我们确定a一定有值,不需要每次都验证他的值是否存在
let sureIsEmpty = a!.hashValue
print(sureIsEmpty)

//隐式解包
if let sure = a {
    print(sure.hashValue)
}



/*
总结-----解包
1.强制对 可选量 进行解包使用（!）
2.隐式解包的可选类型的时候, 一般用于类中的属性
*/
