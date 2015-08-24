//
//  MainViewController.swift
//  Swift15-4
//
//  Created by keyzhang on 15/8/7.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //修改标题
        self.navigationItem.title = "jobs weibo"
        
        //改背景颜色
        var img = UIImage(named: "bj.jpg")
        UIGraphicsBeginImageContext(CGSizeMake(screenWidth, screenHeight))
        img?.drawInRect(UIScreen.mainScreen().bounds)
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        self.view.backgroundColor = UIColor(patternImage: img!)
        
        //添加左侧的两个按钮
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        leftView.backgroundColor = UIColor.clearColor()
        let editorBtn = UIButton(type: UIButtonType.Custom)
        editorBtn.frame = CGRect(x: 5, y: 5, width: 33, height: 32)
        editorBtn.setImage(UIImage(named: "write.png"), forState: UIControlState.Normal)
        editorBtn.setImage(UIImage(named: "write_on.png"), forState: UIControlState.Highlighted)
        editorBtn.addTarget(self, action: "sendAction:", forControlEvents: UIControlEvents.TouchUpInside)
        leftView.addSubview(editorBtn)
        
        let searchBtn = UIButton(type: UIButtonType.Custom)
        searchBtn.frame = CGRect(x: 45, y: 5, width: 33, height: 32)
        searchBtn.setImage(UIImage(named: "btn_search"), forState: UIControlState.Normal)
        searchBtn.addTarget(self, action: "searchAction:", forControlEvents: UIControlEvents.TouchUpInside)
        leftView.addSubview(searchBtn)
        
        let leftItem = UIBarButtonItem(customView: leftView)
        self.navigationItem.leftBarButtonItem = leftItem
        
        //右侧按钮
        let refreshBtn = UIButton(type: UIButtonType.Custom)
        refreshBtn.frame = CGRectMake(0, 0, 33, 32)
        refreshBtn.setImage(UIImage(named: "刷新"), forState: UIControlState.Normal)
        refreshBtn.setImage(UIImage(named: "刷新选中"), forState: UIControlState.Highlighted)
        let rightItem = UIBarButtonItem(customView: refreshBtn)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func sendAction(btn: UIButton) {
        let sendVC = SendViewController()
        let nav = UINavigationController(rootViewController: sendVC)
        
        var img = UIImage(named: "navbar_bg_normal.png")
        UIGraphicsBeginImageContext(CGSizeMake(screenWidth, 64))
        img?.drawInRect(CGRectMake(0, 0, screenWidth, 64))
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        nav.navigationBar.setBackgroundImage(img, forBarMetrics: UIBarMetrics.Default)
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    func searchAction(btn: UIButton) {
        let imgVC = ImageViewViewController()
        self.navigationController?.pushViewController(imgVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
