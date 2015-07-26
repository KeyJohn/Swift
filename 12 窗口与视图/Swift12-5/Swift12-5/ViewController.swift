//
//  ViewController.swift
//  Swift12-5
//
//  Created by keyzhang on 15/7/26.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*************************UIView的Transform使用***********************/
        let view = UIView(frame: CGRect(x: 80, y: 50, width: 200, height: 200))
        view.tag = 100
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = "hehe"
        view.addSubview(label)
        
        let btn = UIButton(type: UIButtonType.InfoDark)
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        self.view.addSubview(btn)
        
        let btn2 = UIButton(type: UIButtonType.DetailDisclosure)
        btn2.addTarget(self, action: "btn2Click:", forControlEvents: UIControlEvents.TouchUpInside)
        btn2.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
        self.view.addSubview(btn2)
        
    }
    
    func btnClick(btn: UIButton) {
        
        let view: UIView = self.view.viewWithTag(100)!
        
        //缩放
        let t: CGAffineTransform = view.transform
        //在原来的基础上进行缩放,每一次都缩小0.5倍
//        view.transform = CGAffineTransformScale(t, 0.5, 0.5)
        //在view原始的基础上进行缩小0.5倍，只会缩小一次
//        view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        //在原来的基础上进行旋转,角度为正表示顺时针旋转
//        view.transform = CGAffineTransformRotate(t, CGFloat(M_PI / 4));
        //平移
        view.transform = CGAffineTransformTranslate(t, -10, -10);

        
    }
    
    func btn2Click(btn: UIButton) {
        //还原
        let view: UIView = self.view.viewWithTag(100)!
        //还原为初始的transform
        view.transform = CGAffineTransformIdentity;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

