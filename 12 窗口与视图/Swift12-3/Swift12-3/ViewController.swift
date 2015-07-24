//
//  ViewController.swift
//  Swift12-3
//
//  Created by keyzhang on 15/7/25.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /***********************Frame和Bounds************************/
//        let view1 = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
//        print(view1.frame)
//        print(view1.bounds)
//        print(view1.center)
//        
//        view1.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        print(view1.frame)
//        print(view1.center)
//
//        
//        view1.backgroundColor = UIColor.redColor()
//        self.view.addSubview(view1)
//        
//        let view2 = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
//        view2.backgroundColor = UIColor.greenColor()
//        view1.addSubview(view2)
        
        
        /***********************视图的层次结构************************/
        
        //创建父视图
        let superView = UIView(frame: CGRect(x: 20, y: 120, width: 300, height: 200))
        superView.tag = 2015
        superView.backgroundColor = UIColor.redColor()
        self.view.addSubview(superView)
        
        //创建子视图
        let view1 = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        view1.tag = 2016
        view1.backgroundColor = UIColor.greenColor()
        //将view1添加到superView上去显示
        superView.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: 90, y: 20, width: 100, height: 100))
        view2.tag = 2017
        view2.backgroundColor = UIColor.cyanColor()
        superView.addSubview(view2)
        
        //通过数组的结构管理子视图
        let subViews = superView.subviews
        for view: UIView in subViews {
            print(view)
        }
        
        //将view2插入到view1的下面
        superView.insertSubview(view2, belowSubview: view1)
        
        //将view2插入到view1的上面
        superView.insertSubview(view2, aboveSubview: view1)
        
        let view3 = UIView(frame: CGRect(x: 50, y: 20, width: 100, height: 100))
        view3.backgroundColor = UIColor.blueColor()
        
        //将view3插入到下标为1的子视图数组中
        superView.insertSubview(view3, atIndex: 1)
        
        
        //按钮
        let btn = UIButton(type: UIButtonType.Custom)
        
        //添加方法
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.backgroundColor = UIColor.grayColor()
        btn.frame = CGRect(x: 100, y: 350, width: 100, height: 40)
        btn.setTitle("change", forState: UIControlState.Normal)
        self.view.addSubview(btn)
        
        
    }
    
    func btnClick(btn: UIButton) {
        //根据tag值拿到视图
        let superView = self.view.viewWithTag(2015)
        
        //交换两个子视图在子视图中的位置
//        superView?.exchangeSubviewAtIndex(1, withSubviewAtIndex: 2)
        
//        let view1 = superView!.viewWithTag(2016)
        //将视图移动到最顶端
//        superView?.bringSubviewToFront(view1!)

        let view2 = superView?.viewWithTag(2017)
        //将视图移动到最底端
//        superView?.sendSubviewToBack(view2!)
        
        //从父视图上移除 安全移除，需要先判断
        if (view2?.superview != nil) {
            view2?.removeFromSuperview()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

