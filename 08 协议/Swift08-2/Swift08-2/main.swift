//
//  main.swift
//  Swift08-2
//
//  Created by keyzhang on 15/7/12.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//定义一个协议，要求遵循者实现certificate()方法
@objc protocol CertificateGenerator {
    func certificate() -> String
    optional func optionalful()
}

@objc class EncryptionGenerator: CertificateGenerator {
    var publicKey = "UDID"
    let privateKey = "123-456-789"
    func certificate() -> String {
        return publicKey + privateKey
        
        
    }
    
}

let generator = EncryptionGenerator()
print(generator.certificate())


//在方法或者函数内部改变实例类型的方法称为突变方法
//在值类型中的函数前缀加上mutating关键字表示该函数允许改变实例和其属性的类型
//注意： mutating关键字只用于结构体和枚举

protocol MutatingProtocol {
    mutating func turn()
}


enum OnOffSwitch: MutatingProtocol {
    case Off, On
    mutating func turn() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.On
lightSwitch.turn()
print(lightSwitch)


// 把协议作为类型使用
protocol RandomNumberGenerator {
    func random() -> Double
}

//线性同余生成器---蒙特卡罗算法
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}



class Dice {
    let sides: Int
    let generator: RandomNumberGenerator    //代理对象
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int{
        return Int(generator.random() * Double(sides)) + 1
    }
}


var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...10 {
    print("Randomdiceroll is \(d6.roll())")
    
}






