//
//  ViewController.swift
//  Swift13-6
//
//  Created by keyzhang on 15/7/29.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate, UIActionSheetDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //提示框
        self._initAlertView()
        //提示界面
        self._initActionSheet()
        //分段控件
        self._initsegmentControl()

        
    }
    
    func _initAlertView() {
        
        let btn = UIButton(type: UIButtonType.ContactAdd)
        btn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        btn.addTarget(self, action: "showAlert", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func showAlert() {
//        let alertView = UIAlertView(title: "警告", message: "密码错误", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
////        let alertView = UIAlertView(title: "警告", message: "密码错误", delegate: self, cancelButtonTitle: "取消")
//        
//        //设置alertView的样式
//        alertView.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
//        alertView.show()
        
        
        let alertCtrl = UIAlertController(title: "警告", message: "密码错误", preferredStyle: UIAlertControllerStyle.Alert)
        alertCtrl.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "输入账号"
        }

        alertCtrl.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "输入密码"
            textField.secureTextEntry = true
        }
        let sureAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Destructive) { (alertAction) -> Void in
            let tfs: [UITextField] = alertCtrl.textFields!
            let tf1: UITextField = tfs[0]
            let tf2: UITextField = tfs[1]
            print("确定:\(alertAction.title)")
            print(tf1.text)
            print(tf2.text)
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Destructive) { (alertAction) -> Void in
            print("取消:\(alertAction.title)")
        }
        alertCtrl.addAction(sureAction)
        alertCtrl.addAction(cancelAction)
        self.presentViewController(alertCtrl, animated: true, completion: nil)
    }
    
    
    
    func _initActionSheet() {
        let btn = UIButton(type: UIButtonType.InfoDark)
        btn.frame = CGRect(x: 200, y: 100, width: 50, height: 50)
        btn.addTarget(self, action: "showActionSheet", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func showActionSheet() {
//        let actionSheet = UIActionSheet(title: "提示", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: "确定", otherButtonTitles: "按钮1", "按钮2")
//        actionSheet.showInView(self.view)
        let alertCtrl = UIAlertController(title: "提示", message: "重点提示", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let sureAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            print("确定:\(alertAction.title)")
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            print("取消:\(alertAction.title)")
        }
        alertCtrl.addAction(sureAction)
        alertCtrl.addAction(cancelAction)
        self.presentViewController(alertCtrl, animated: true, completion: nil)
    }
    
    func _initsegmentControl() {
        // 设置按钮的标题数组
        let array: [String] = ["选择","搜索","工具"]
        // 创建分段控件
        let segmentCtrl = UISegmentedControl(items: array)
        segmentCtrl.frame = CGRect(x: 20, y: 30, width: 150, height: 25)
        // 设置默认选中按钮
        segmentCtrl.selectedSegmentIndex = 0
        segmentCtrl.addTarget(self, action: "segmentAction:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(segmentCtrl)
    }
    
    func segmentAction(segment: UISegmentedControl) {
        print(segment.selectedSegmentIndex)
    }

    
    //FIXME: 以下代理方法在iOS8以后被弃用
//    //MARK: UIAlertViewDelegate
//    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
//        
//        let tf1: UITextField = alertView.textFieldAtIndex(0)!
//        let tf2: UITextField = alertView.textFieldAtIndex(1)!
//        
//        print(buttonIndex)
//        
//        if buttonIndex == 0 {
//            print("cancel")
//        }else if buttonIndex == 1 {
//            print("tf1 is \(tf1.text), tf2 is \(tf2.text)")
//        }
//    }
//    
//    //MARK: UIActionSheetDelegate
//    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
//        print(buttonIndex)
//    }


}

