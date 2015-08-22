//
//  SecondViewController.swift
//  Swift15-2
//
//  Created by keyzhang on 15/8/6.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.grayColor()
        
        self.title = "第1个控制器";
        
        //创建push按钮
        let pushbtn = UIButton(type: UIButtonType.Custom)
        pushbtn.backgroundColor = UIColor.blackColor()
        pushbtn.setTitle("push", forState: UIControlState.Normal)
        pushbtn.frame = CGRectMake(100, 100, 100, 30)
        pushbtn.addTarget(self, action: "pushBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(pushbtn)
        
        //创建pop按钮
        let popbtn = UIButton(type: UIButtonType.Custom)
        popbtn.backgroundColor = UIColor.blackColor()
        popbtn.setTitle("pop", forState: UIControlState.Normal)
        popbtn.frame = CGRectMake(100, 200, 100, 30)
        popbtn.addTarget(self, action: "popBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(popbtn)
    }
    
    func pushBtnClick(btn: UIButton) {
        
        let otherVC = OtherViewController()
        self.navigationController?.pushViewController(otherVC, animated: true)
        
    }
    func popBtnClick(btn: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
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
