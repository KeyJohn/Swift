//
//  ViewController.swift
//  Swift13-1
//
//  Created by keyzhang on 15/7/26.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //标签
        self._initLabel()
        
        //按钮
        self._initButton()
    }

    
    //MARK: 标签
    func _initLabel() {
        
        let textlabel = UILabel(frame: CGRect(x: 10, y: 30, width: 100, height: 150))
        
        textlabel.backgroundColor = UIColor.grayColor()
        
        textlabel.text = "good morning haha hehe hoho"
        
        //设置字体, systemFont使用系统字体， 大小为10，默认大小17
        textlabel.font = UIFont.systemFontOfSize(14)
        //粗体字体
        textlabel.font = UIFont.boldSystemFontOfSize(20)
        
        //字体类UIFont
        let familyNames: [String] = UIFont.familyNames()
        print(familyNames)
        textlabel.font = UIFont(name: "Bodoni 72 Oldstyle", size: 15)
        
        //设置字体颜色
        textlabel.textColor = UIColor.orangeColor()
        
        //改变文本对齐方式
        textlabel.textAlignment = NSTextAlignment.Center
        
        //设置显示的行数,默认是1行,如果设置为0,是自动换行
        textlabel.numberOfLines = 0
        
        //自动根据文本调整宽度和高度
//        textlabel.sizeToFit()
        
        self.view.addSubview(textlabel)
        
    }
    
    
    //MARK: 按钮
    func _initButton() {
        let button = UIButton(type: UIButtonType.Custom)
        button.frame = CGRect(x: 10, y: 180, width: 90, height: 144)
        
        //设置一般状态的显示标题,标题总是需要和状态绑定到一起的
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("hehe", forState: UIControlState.Normal)
        button.setTitle("haha", forState: UIControlState.Highlighted)
        
        //设置标题的字体
        button.titleLabel?.font = UIFont.systemFontOfSize(10)
        
        //添加点击事件
        button.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //设置图片
        //设置背景图片
        //imageNamed：在当前工程目录下找到名字为“”的图片，表示的是图片数据
        let image1 = UIImage(named: "back_on.png")
        //setBackgroundImage 会将图片拉伸
//        button.setBackgroundImage(image1, forState: UIControlState.Normal)
        
        let image2 = UIImage(named: "back_on_black.png")
//        button.setBackgroundImage(image2, forState: UIControlState.Highlighted)
        
        //直接设置图片，图片不会被拉伸
        button.setImage(image1, forState: UIControlState.Normal)
        button.setImage(image2, forState: UIControlState.Highlighted)
        
        //设置tileLabel的位置偏移
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -90, 0, 0)
        
        button.setTitle("选中", forState: UIControlState.Selected)
        
        //改变按钮的选中状态
        button.selected = true
        
        //设置按钮是否为可用状态
//        button.enabled = false
        
        //是否响应触摸时间
//        button.userInteractionEnabled = false
        
        self.view.addSubview(button)

    }
    
    
    func btnClick(btn: UIButton) {
        print(btn)
        btn.selected = !btn.selected
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

