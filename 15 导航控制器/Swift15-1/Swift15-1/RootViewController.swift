//
//  RootViewController.swift
//  Swift15-1
//
//  Created by keyzhang on 15/8/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "第一个控制器"
        self.view.backgroundColor = UIColor.orangeColor()
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.backgroundColor = UIColor.blackColor()
        btn.setTitle("push", forState: UIControlState.Normal)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func btnClick(btn: UIButton) {
        let detailVC = DetailViewController()
        
        //push到下一个界面
        self.navigationController?.pushViewController(detailVC, animated: true)
        
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
