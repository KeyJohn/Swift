//
//  ViewController.swift
//  Swift11-1
//
//  Created by keyzhang on 15/7/18.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myView: UIView! = NSBundle.mainBundle().loadNibNamed("MyView", owner: self, options: nil).last as! UIView
        myView.frame.origin = CGPoint(x: 10, y: 100)
        //将view作为子视图添加到当前的视图当中
        self.view.addSubview(myView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

