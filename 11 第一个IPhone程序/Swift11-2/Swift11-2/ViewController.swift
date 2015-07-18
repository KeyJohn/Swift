//
//  ViewController.swift
//  Swift11-2
//
//  Created by keyzhang on 15/7/18.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //使用纯代码
        
        //创建绿色的view
        let greenView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        //将视图的背景颜色改为绿色
        greenView.backgroundColor = UIColor.greenColor()
        //将绿色的视图添加到window上
        self.view.addSubview(greenView)
        
        
        //创建Label
        let myLabel = UILabel(frame: CGRect(x: (200 - 100) / 2, y: (200 - 30) / 2, width: 100, height: 30))
        //把label的背景改为蓝色
        myLabel.backgroundColor = UIColor.blueColor()
        //设置label的文本
        myLabel.text = "第一个UI程序"
        //设置字体
        myLabel.font = UIFont.systemFontOfSize(14.0)
        //设置文本字体颜色
        myLabel.textColor = UIColor.orangeColor()
        //设置文本居中
        myLabel.textAlignment = NSTextAlignment.Center
        greenView.addSubview(myLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

