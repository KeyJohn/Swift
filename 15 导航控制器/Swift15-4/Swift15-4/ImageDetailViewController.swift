//
//  ImageDetailViewController.swift
//  Swift15-4
//
//  Created by keyzhang on 15/8/7.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    var _img: UIImage?
    var img: UIImage{
        get{
            return _img!
        }
        set{
            _img = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "无限图片";
        
        //改背景颜色
        var img = UIImage(named: "bj.jpg")
        UIGraphicsBeginImageContext(CGSizeMake(screenWidth, screenHeight))
        img?.drawInRect(UIScreen.mainScreen().bounds)
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: img!)
        //设置导航栏半透明
        self.navigationController!.navigationBar.translucent = true;
        
        //创建全屏button
        let imgBtn = UIButton(type: UIButtonType.Custom)
        imgBtn.backgroundColor = UIColor.clearColor()
        imgBtn.frame = UIScreen.mainScreen().bounds
        imgBtn.setBackgroundImage(self.img, forState: UIControlState.Normal)
        imgBtn.setBackgroundImage(self.img, forState: UIControlState.Highlighted)
        imgBtn.addTarget(self, action: "imgBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(imgBtn)
    }
    
    func imgBtnClick(btn: UIButton) {
        UIApplication.sharedApplication().setStatusBarHidden(!(self.navigationController?.navigationBarHidden)!, withAnimation: UIStatusBarAnimation.Fade)
        self.navigationController?.setNavigationBarHidden(!(self.navigationController?.navigationBarHidden)!, animated: true)
    }
    
    //视图即将消失的时候
    override func viewWillDisappear(animated: Bool) {
        //设置导航栏不透明
        self.navigationController?.navigationBar.translucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
