//
//  ViewController.swift
//  Swift12-6
//
//  Created by keyzhang on 15/7/26.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**************************UIView动画**************************/
        let view = UIView(frame: CGRect(x: 80, y: 50, width: 100, height: 100))
        view.tag = 2015
        view.backgroundColor = UIColor.greenColor()
        self.view.addSubview(view)
        
        let btn = UIButton(type: UIButtonType.ContactAdd)
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.frame = CGRect(x: 50, y: 400, width: 100, height: 40)
        self.view.addSubview(btn)
        
    }
    
    func btnClick(btn: UIButton) {
        let view: UIView = self.view.viewWithTag(2015)!
        
        //开始动画
        UIView.beginAnimations("animation1", context: nil)
        
        //配置动画的属性
        //设置动画持续的时间
        UIView.setAnimationDuration(2)
        //设置动画的代理
        UIView.setAnimationDelegate(self)
        
        //设置动画的加速方式 EaseInOut: 开始和结束的时候速度稍慢
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        //设置动画重复的次数
        UIView.setAnimationRepeatCount(2)
        
        //设置动画失效
//        UIView.setAnimationsEnabled(false)
//        print(UIView.areAnimationsEnabled())
        
        //设置动画是否反向执行一次
        UIView.setAnimationRepeatAutoreverses(true)
        //延迟调用动画
//        UIView.setAnimationDelay(2)
        //移动动画
//        view.frame.origin.y = 350
        
        //修改透明度
//        view.alpha = 0
        
        //修改尺寸
//        view.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        //改变背景颜色
//        view.backgroundColor = UIColor.redColor();
        
        //tarnsform改变
        view.transform = CGAffineTransformRotate(view.transform, CGFloat(M_PI / 8))

        //提交动画
        UIView.commitAnimations()
        
        
        //使用blok动画
//        UIView.animateWithDuration(3, animations: { () -> Void in
//            view.frame.origin.y = 350
//            }) { (finished) -> Void in
//                UIView.animateWithDuration(2, animations: { () -> Void in
//                    view.frame.origin.x = 250
//                })
//        }
        
        
    }
    

    func animationWillStart(animationID: String, context: UnsafeMutablePointer<Void>) {
        print(animationID, context) //("animation1", 0x0000000000000000)
    }
    
    func animationDidStop(animationID: String, finished flag: Bool, context: UnsafeMutablePointer<Void>) {
        print(animationID, context)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

