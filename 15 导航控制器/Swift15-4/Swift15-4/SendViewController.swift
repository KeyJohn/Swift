//
//  SendViewController.swift
//  Swift15-4
//
//  Created by keyzhang on 15/8/7.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class SendViewController: UIViewController, UITextViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "写微博";
        //改背景颜色
        var img = UIImage(named: "bj.jpg")
        UIGraphicsBeginImageContext(CGSizeMake(screenWidth, screenHeight))
        img?.drawInRect(UIScreen.mainScreen().bounds)
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: img!)
        let backBtn = UIButton(type: UIButtonType.Custom)
        backBtn.frame = CGRectMake(0, 0, 68, 33)
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.addTarget(self, action: "backAction:", forControlEvents: UIControlEvents.TouchUpInside)
        backBtn.setBackgroundImage(UIImage(named: "back"), forState: UIControlState.Normal)
        backBtn.setBackgroundImage(UIImage(named: "back_on"), forState: UIControlState.Highlighted)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)

        //文本编辑框
        let textView = UITextView(frame: CGRectMake(10, 10, screenWidth - 20, 100))
        textView.delegate = self
        textView.font = UIFont.systemFontOfSize(16)

        //弹出键盘
        textView.becomeFirstResponder()
        self.view.addSubview(textView)
    }
    
    func backAction(btn: UIButton) {
        //关闭模态视图
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
