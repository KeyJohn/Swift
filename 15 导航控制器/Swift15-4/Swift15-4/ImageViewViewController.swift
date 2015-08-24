//
//  ImageViewViewController.swift
//  Swift15-4
//
//  Created by keyzhang on 15/8/7.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ImageViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //修改标题
        self.navigationItem.title = "图片新闻"
        
        //改背景颜色
        var img = UIImage(named: "bj.jpg")
        UIGraphicsBeginImageContext(CGSizeMake(screenWidth, screenHeight))
        img?.drawInRect(UIScreen.mainScreen().bounds)
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: img!)
        //返回按钮
        let backBtn = UIButton(type: UIButtonType.Custom)
        backBtn.frame = CGRectMake(0, 0, 68, 33)
        backBtn.setTitle("返回", forState: UIControlState.Normal)
        backBtn.addTarget(self, action: "backAction:", forControlEvents: UIControlEvents.TouchUpInside)
        backBtn.setBackgroundImage(UIImage(named: "back"), forState: UIControlState.Normal)
        backBtn.setBackgroundImage(UIImage(named: "back_on"), forState: UIControlState.Highlighted)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        
        //两个按钮图片
        let btn1 = UIButton(type: UIButtonType.Custom)
        btn1.tag = 101
        btn1.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        btn1.setImage(UIImage(named: "20120618100.jpg"), forState: UIControlState.Normal)
        btn1.addTarget(self, action: "imageAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn1)
        
        let btn2 = UIButton(type: UIButtonType.Custom)
        btn2.tag = 102
        btn2.frame = CGRect(x: 120, y: 10, width: 100, height: 100)
        btn2.setImage(UIImage(named: "20120618101.jpg"), forState: UIControlState.Normal)
        btn2.addTarget(self, action: "imageAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn2)
    }
    
    func backAction(btn: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func imageAction(btn: UIButton) {
        let imgDetailVC = ImageDetailViewController()
        imgDetailVC.img = btn.imageForState(UIControlState.Normal)!
        self.navigationController?.pushViewController(imgDetailVC, animated: true)
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
