//
//  DetailViewController.swift
//  Swift15-1
//
//  Created by keyzhang on 15/8/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第二个控制器";
        self.view.backgroundColor = UIColor.cyanColor()
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.backgroundColor = UIColor.blackColor()
        btn.setTitle("pop", forState: UIControlState.Normal)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)

    }
    
    func btnClick(btn: UIButton) {
        //通过导航控制器pop回去
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("hehe")
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
