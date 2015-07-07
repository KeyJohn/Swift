//
//  main.swift
//  Swift05-2
//
//  Created by keyzhang on 15/7/7.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

/* 闭包（Closures）
* 闭包是自包含的功能代码块，可以在代码中使用或者用来作为参数传值。
* 在Swift中的闭包与C、OC中的blocks和其它编程语言（如Python）中的lambdas类似。
* 闭包可以捕获和存储上下文中定义的的任何常量和变量的引用。这就是所谓的变量和变量的自封闭，
* 因此命名为”闭包“("Closures）").Swift还会处理所有捕获的引用的内存管理。
*
* 全局函数和嵌套函数其实就是特殊的闭包。
* 闭包的形式有：
* （1）全局函数都是闭包，有名字但不能捕获任何值。
* （2）嵌套函数都是闭包，且有名字，也能捕获封闭函数内的值。
* （3）闭包表达式都是无名闭包，使用轻量级语法，可以根据上下文环境捕获值。
*
* Swift中的闭包有很多优化的地方:
* (1)根据上下文推断参数和返回值类型
* (2)从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
* (3)可以使用简化参数名，如$0, $1(从0开始，表示第i个参数...)
* (4)提供了尾随闭包语法(Trailing closure syntax)
*/

// 下面用Swift标准库中的sort方法来一步步简化闭包写法
// sort函数需要两个参数
// 参数一：数组
// 参数二：一个闭包：带有两个参数，这两个参数类型与数组中的元素类型相同，返回值是Bool
var names = ["Swift", "Arial", "Soga", "Donary"]

// 第一种方式：使用函数
func backwards(firstString: String, secondString: String) -> Bool {
    return firstString > secondString // 降序排序
}

// 这里第二个参数，传了一个函数
// reversed is equal to ["Swift", "Soga", "Donary", "Arial"]
var reversed = names.sort(backwards)
print(reversed)

// 第二种方式：使用闭包方式
// 完整闭包写法是在花括号内有参数列表和返回值，用关键字in表明闭包体的开始
// (fir: String, sec: String) 闭包参数列表
// -> Bool 指明闭包返回值类型是Bool
// in关键字表明闭包体的开始
reversed = names.sort({ (fir: String, sec: String) -> Bool in
    return fir > sec
})
print(reversed)

// 这里可以进一步简化写法，因为闭包代码比较短，可以写到一行上
reversed = names.sort({ (fir: String, sec: String) -> Bool in return fir > sec})
print(reversed)


// 下面再进一步简化写法 ：根据环境上下文自动推断出类型
// 参数列表都没有指明类型，也没有指明返回值类型，这是因为swift可以根据上下文推测出
// firstString和secondString的类型会是names数组元素的类型，而返回值类型会根据return语句结果得到
reversed = names.sort({ (fir, sec) -> Bool in return fir > sec})
print(reversed)


// 再进一步简化：隐式返回（单行语句闭包）
// 因为闭包体只有一行代码，可以省略return
//reversed = sort(names, { firstString, secondString in firstString > secondString})
reversed = names.sort({ (fir, sec) -> Bool in fir > sec})
print(reversed)


// 再进一步简化：使用简化参数名（$i,i=0,1,2...从0开始的）
// Swift会推断出闭包需要两个参数，类型与names数组元素相同
reversed = names.sort({$0 > $1})
print(reversed)


// 最简单的一种写法：使用操作符
//reversed: [Arial, Donary, Soga, Swift]
reversed = names.sort(<)    //升序
print(reversed)


/*
* 尾随闭包（Trailing Closures）
* 如果函数需要一个闭包参数作为参数，且这个参数是最后一个参数，而这个闭包表达式又很长时，
* 使用尾随闭包是很有用的。尾随闭包可以放在函数参数列表外，也就是括号外。如果函数只有一个参数，
* 那么可以把括号()省略掉，后面直接跟着闭包。
*/

// Array的方法map()就需要一个闭包作为参数
let strings = names.map { (str: String) -> String in
    return str + "hehe"
}
print(strings)


/* 捕获值
* 闭包可以根据环境上下文捕获到定义的常量和变量。闭包可以引用和修改这些捕获到的常量和变量，
* 就算在原来的范围内定义为常量或者变量已经不再存在（很牛逼）。
* 在Swift中闭包的最简单形式是嵌套函数。
*/
func increment(amount amount: Int) -> (() -> Int) {
    var total = 0
    func incrementAmount() -> Int {
        total += amount // total是外部函数体内的变量，这里是可以捕获到的
        return total
    }
    return incrementAmount // 返回的是一个嵌套函数（闭包）
}

// 闭包是引用类型，所以incrementByTen声明为常量也可以修改total
let incrementByTen = increment(amount: 10)
print(incrementByTen()) //return 10,incrementByTen是一个闭包
// 这里是没有改变对increment的引用，所以会保存之前的值
print(incrementByTen())// return 20
print(incrementByTen())// return 30


let incrementByOne = increment(amount: 1)
print(incrementByOne()) // return 1
print(incrementByOne()) // return 2
print(incrementByTen()) // return 40
print(incrementByOne()) // return 3

