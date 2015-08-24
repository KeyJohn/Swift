//
//  RootViewController.swift
//  Swift15-3
//
//  Created by keyzhang on 15/8/6.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "这是标题"
        self.view.backgroundColor = UIColor.yellowColor()
        
        //自定义标题视图
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
//        titleLabel.textAlignment = NSTextAlignment.Center
//        titleLabel.backgroundColor = UIColor.grayColor()
//        titleLabel.font = UIFont.boldSystemFontOfSize(25)
//        titleLabel.textColor = UIColor.redColor()
//        titleLabel.text = "hehe"
//        self.navigationItem.titleView = titleLabel
        let button = UIButton(type: UIButtonType.System)
        button.setTitle("按钮", forState: UIControlState.Normal)
        button.addTarget(self, action: "titleViewBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        self.navigationItem.titleView = button
        
        /*----------------------UINavigationItem两侧按钮----------------*/
        //第一种方式
        let leftItem1 = UIBarButtonItem(title: "anniu", style: UIBarButtonItemStyle.Done, target: self, action: "leftAnniuClick")
//        self.navigationItem.leftBarButtonItem = leftItem1
        
        //第一种方式
        let leftItem2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Bookmarks, target: self, action: "btnClick:")
//        self.navigationItem.leftBarButtonItem = leftItem2
        self.navigationItem.leftBarButtonItems = [leftItem1, leftItem2]
        
        //第三种方式（自定义按钮）
        let rightButton = UIButton(type: UIButtonType.Custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 33, height: 32)
        rightButton.addTarget(self, action: "rightBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        rightButton.setImage(UIImage(named: "btn_search.png"), forState: UIControlState.Normal)
        let rightItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightItem

        /*----------------UINavigationBar导航栏背景设置------------------*/

        //隐藏导航栏
//        self.navigationController?.navigationBarHidden = true
        //设置导航栏背景风格
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Default
        //设置导航栏的半透明效果，默认是yes
//        self.navigationController?.navigationBar.translucent = false
        //设置导航栏的背景颜色(必须有半透明效果)
//        self.navigationController?.navigationBar.backgroundColor = UIColor.redColor()
        //将导航上所有的Label的字体变色
        self.navigationController?.navigationBar.tintColor = UIColor.redColor()
        //设置图片作为导航栏的背景,设置了背景图片，导航栏就不透明
        var img = UIImage(named: "navbar_bg_normal.png")
        UIGraphicsBeginImageContext(CGSizeMake(width, 64))
        img?.drawInRect(CGRect(x: 0, y: 0, width: width, height: 64))
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController?.navigationBar.setBackgroundImage(img, forBarMetrics: UIBarMetrics.Default)
        
        //设置提示文本,通常用不上
//        self.navigationItem.prompt = "正在保存";
        
    }
    
    func titleViewBtnClick(btn: UIButton) {
        print("标题被点击了")
    }
    
    func leftAnniuClick() {
        print("anniu被点击了")
    }
    
    func btnClick(btn: UIButton) {
        print(btn)
    }
    
    func rightBtnClick(btn: UIButton) {
        print("rightBtnClick")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
