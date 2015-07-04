//
//  ViewController.swift
//  Swift01-2
//
//  Created by keyzhang on 15/6/21.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //1、标识符
        //开发过程中给变量、常量、方法、函数、枚举、结构体、类、协议等指定的名字。
        //标识符区需要有一定的规范、分大小写！
        //由大小写字母A-Z、下划线_、Unicode、数字、中文组成，首字符不能是数字
        
        let hello = 111222
        let _123 = "123"
        let 呵呵 = "hehe"
        let _class = "😝😔😌😗😙😂"
        let 🎅 = "🐶🐺🐱🐭🐗🐦🐧🐗"
        
        
        //2、关键字
        //关键字是对编译器具有特殊意义的保留字符，不能用做标识符，在一般的编译工具中会标识为特定的颜色
//        class break func......
        
        //3、注释
        //注释就是笔记和提示，方便阅读，编译器在编译时会自动忽略，不影响程序的编译
        
        //这是单行注释
        /*
        这是多行注释
        */
        
        /*
            /*
                /*
                    注释在swift中是可以嵌套的
                */
            */
        */
        
        
        //4、分号
        let a = 10; //可以加上分号
        let b = 10  //也可以不加分号
        let c = 10, d = 10
//        let e = 10 ; println(e) //在同一行中写多行语句，必须使用分号隔开
        let e = 10 ; print(e)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

