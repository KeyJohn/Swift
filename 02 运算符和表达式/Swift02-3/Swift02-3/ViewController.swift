//
//  ViewController.swift
//  Swift02-3
//
//  Created by keyzhang on 15/6/27.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //定义枚举
        enum MapDirection {
            case North
            case South
            case East
            case West
            func simpleDescription() -> String {
                switch self {
                case .North:
                    return "North"
                case .South:
                    return "South"
                case .East:
                    return "East"
                case .West:
                    return "West"
                }
            }
        }
        
//        let en: MapDirection = MapDirection.North
        var en = MapDirection.North
        print(en.simpleDescription())
        en = .West
        print(en.simpleDescription())

        
        //定义结构体
        struct Summation {
            var addend: Int
            var augend: Int
            
            var addstring: String
            var augstring: String
            
            func sum() -> Int {
                return addend + augend
            }
            
            func sumstring() -> String {
                return addstring + augstring
            }
            
        }
        
        //创建一个结构体
//        let newStruct = Summation(addend: 10, augend: 20)
        let newStruct = Summation(addend: 10, augend: 20, addstring: "newStruct", augstring: "newStruct")
        
        //使用结构体内的方法
        let sum = newStruct.sum()
        print(sum)
        
        print(newStruct.sumstring())
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

