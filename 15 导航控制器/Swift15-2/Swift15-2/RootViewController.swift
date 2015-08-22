//
//  RootViewController.swift
//  Swift15-2
//
//  Created by keyzhang on 15/8/6.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "第0个控制器";
        self.view.backgroundColor = UIColor.redColor()
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.backgroundColor = UIColor.blackColor()
        btn.setTitle("push", forState: UIControlState.Normal)
        btn.frame = CGRectMake(100, 100, 100, 30)
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func btnClick(btn: UIButton) {
        
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
        
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
