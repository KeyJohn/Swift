//
//  ViewController.swift
//  Swift14-3
//
//  Created by keyzhang on 15/8/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let height = UIScreen.mainScreen().bounds.size.height
    let width = UIScreen.mainScreen().bounds.size.width

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView(frame: CGRectMake((width - 100) / 2, (height - 100) / 2, 100, 100))
        view.tag = 100
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //设置控制器支持的旋转方向
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        //对于ipad而言默认是支持UIInterfaceOrientationMaskAll，  iPhone默认支持UIInterfaceOrientationMaskAllButUpsideDown
        return UIInterfaceOrientationMask.All
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        print(toInterfaceOrientation)
        
        switch toInterfaceOrientation {
        case .LandscapeLeft:
            fallthrough
        case .LandscapeRight:
            let view = self.view.viewWithTag(100)
            view?.frame = CGRectMake((height - 100)/2, (width - 100)/2, 100, 100)
            
        case .Portrait:
            fallthrough
        case.PortraitUpsideDown:
            let view = self.view.viewWithTag(100)
            view?.frame = CGRectMake((width - 100)/2, (height - 100)/2, 100, 100)
            
        default: print("hehe")
        }
    }
    
    
    
}



