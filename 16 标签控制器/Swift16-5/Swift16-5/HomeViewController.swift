//
//  HomeViewController.swift
//  Swift16-5
//
//  Created by keyzhang on 15/8/9.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //创建左侧按钮
        let leftBtn = UIButton(type: UIButtonType.Custom)
        leftBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        leftBtn.setTitle("        我的微博", forState: UIControlState.Normal)
        leftBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 43)
        leftBtn.setBackgroundImage(UIImage(named: "button_title.png"), forState: UIControlState.Normal)
        
        let imgView = UIImageView(image: UIImage(named: "group_btn_all_on.png"))
        imgView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        leftBtn.addSubview(imgView)
        
        let leftItem = UIBarButtonItem(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem

        //创建右侧按钮
        let rightBtn = UIButton(type: UIButtonType.Custom)
        rightBtn.frame = CGRect(x: 0, y: 0, width: 43, height: 43)
        rightBtn.setBackgroundImage(UIImage(named: "button_m"), forState: UIControlState.Normal)
        rightBtn.setImage(UIImage(named: "button_icon_plus"), forState: UIControlState.Normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
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
