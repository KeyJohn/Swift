//
//  ViewController.swift
//  Swift13-2
//
//  Created by keyzhang on 15/7/26.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //文本输入框
        self._initTextField()
    }
    
    //MARK: 文本输入框
    func _initTextField() {
        //如果需要在模拟器中调用电脑的键盘 快捷键：command + shift + k
        let textField = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 30))
        textField.backgroundColor = UIColor.redColor()
        textField.tag = 100
        textField.delegate = self
        self.view.addSubview(textField)
        
        //设置输入框的边框样式 默认无边框
        textField.borderStyle = UITextBorderStyle.RoundedRect
        
        //设置输入文本的字体
        textField.font = UIFont.boldSystemFontOfSize(10)
        
        //设置文字的颜色
        textField.textColor = UIColor.greenColor()
        
        //设置或获取输入框中的内容
//        textField.text = "hehe"
        
        //设置对齐方式
        textField.textAlignment = NSTextAlignment.Center
        
        //设置首字母是否自动大写
        textField.autocapitalizationType = UITextAutocapitalizationType.Words
        
        //设置自动单词提示
        textField.autocorrectionType = UITextAutocorrectionType.No
        
        //输入框为空时的提示文本
        textField.placeholder = "请输入登陆邮箱"
        
        //修改键盘上的return按钮上的标题
        textField.returnKeyType = UIReturnKeyType.Go
        
        //输入框是否安全输入
        textField.secureTextEntry = true
        
        //数字键盘
        textField.keyboardType = UIKeyboardType.NumberPad
        
        //开启清楚按钮
        textField.clearButtonMode = UITextFieldViewMode.WhileEditing
        
//        //成为第一响应者，弹出键盘
        textField.becomeFirstResponder()
//
//        //失去第一响应者,收起键盘
//        textField.resignFirstResponder()
        
        let btn = UIButton(type: UIButtonType.ContactAdd)
        btn.frame = CGRect(x: 0, y: 100, width: 50, height: 50)
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        
    }
    
    func btnClick(btn: UIButton) {
        //失去第一响应者
        let textField = self.view.viewWithTag(100) as! UITextField
        textField.resignFirstResponder()
    }
    
    //MARK: UITextFieldDelegate
    //将要开始编辑
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("将要开始编辑")
        //返回true表示继续编辑，返回false是阻止编辑
        return true
    }
    
    //开始编辑
    func textFieldDidBeginEditing(textField: UITextField) {
        print("开始编辑")
    }
    
    //结束编辑时调用的协议方法
    func textFieldDidEndEditing(textField: UITextField) {
        print("已经结束")
    }
    
    //输入框的内容被修改时调用的协议方法
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("range is \(range), string is \(string)")
        return true
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

