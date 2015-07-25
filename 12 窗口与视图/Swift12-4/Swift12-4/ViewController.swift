//
//  ViewController.swift
//  Swift12-4
//
//  Created by keyzhang on 15/7/26.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**************************UIView的常用属性**************************/
        let view1 = UIView(frame: CGRect(x: 10, y: 50, width: 300, height: 300))
        view1.tag = 100
        //背景颜色
        view1.backgroundColor = UIColor.redColor()
        self.view.addSubview(view1)
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view2.backgroundColor = UIColor.orangeColor()
        view1.addSubview(view2)
        
        let btn = UIButton(type: UIButtonType.ContactAdd)
        btn.frame = CGRect(x: 100, y: 400, width: 100, height: 50)
        btn.addTarget(self, action: "change:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
    }
    
    func change(btn: UIButton) {
        //从btn的父视图（self.view）上根据tag值拿到view1
        let view1 = btn.superview?.viewWithTag(100)
        
        //改变view1的透明度
        view1?.backgroundColor = UIColor.greenColor()
        view1?.alpha = 0.2
//        view1?.hidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

