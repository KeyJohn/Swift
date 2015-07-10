//
//  main.swift
//  Swift06-2
//
//  Created by keyzhang on 15/7/10.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

/*
******************AnyObject***************
*/

//AnyObject  相当于    id 类型
var myObject: AnyObject = NSMutableDictionary()
//myObject = NSDate()     //如果没有AnyObject会报错

myObject.count     //运行崩溃，对象没有这个方法
//let futureDate = (myObject as! NSDate).dateByAddingTimeInterval(-60)
//print(futureDate)


//只有到运行时才知道myObject的类型，所以有可能写出不安全的代码
//当AnyObject对象调用一个方法时，可以通过optional特性决定对象是否调用该方法
if let dic = myObject.count {
    print(dic)
}

//对于Swift中的强制类型转换，从AnyObject类型的对象转换成明确类型并不会保证成功，所以会返回一个可选值，需要通过检测该值类确定是否转换成功
let userDefaults = NSUserDefaults.standardUserDefaults()
let date = userDefaults.objectForKey("date")
if let trueDate = date as? NSDate {
    print(trueDate)
}

//如果能确定这个对象类型，并且确定不是nil，可以使用as!操作符进行强制调用
//let suredate = date as! NSDate   //运行报错，强制转换出错
//let timeInterval = suredate.timeIntervalSinceReferenceDate


/*
    ******************nil***************
*/

//nil表示值不存在，如果需要表示一个缺失的值，可以使用Optional

//let test: String = nil    //错误

var testStr: String?    //如果没有赋值，则自动设为nil

print(testStr)

//注意：nil在Swift中可以用在基本数据类型中，并不像OC那样表示指针
var a: Int? = nil   //＝nil可以省略
print(a)



