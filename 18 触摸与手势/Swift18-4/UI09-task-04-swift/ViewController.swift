//
//  ViewController.swift
//  UI09-task-04-swift
//
//  Created by keyzhang on 15/4/10.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let touchView = TouchView(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
        touchView.backgroundColor = UIColor.redColor()
        self.view.addSubview(touchView)
        
        
        let btn = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 40))
        btn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.backgroundColor = UIColor.blueColor()
        touchView.addSubview(btn)
        
        let lview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        lview.backgroundColor = UIColor.orangeColor()
        btn.addSubview(lview)
//
    }
    
    func btnClick(btn: UIButton) {
        print("btn Click")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

