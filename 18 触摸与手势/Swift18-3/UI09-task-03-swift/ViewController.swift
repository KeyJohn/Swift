//
//  ViewController.swift
//  UI09-task-03-swift
//
//  Created by keyzhang on 15/4/10.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //开启多点触控
        self.view.multipleTouchEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.count == 2 {
            
            let set = touches as NSSet
            var touchArray = set.allObjects
            
            
            //取得两个UITouch对象
            let touch1 = touchArray[0] as! UITouch
            let touch2 = touchArray[1] as! UITouch
            //取得两个触摸点
            let p1 = touch1.locationInView(self.view)
            let p2 = touch2.locationInView(self.view)
            
            //计算两个点的距离
            let nowDistance = distanceTowPoint(p1, withPoint: p2)
            
            //上一次两个点的距离
            let lastp1 = touch1.previousLocationInView(self.view)
            let lastp2 = touch2.previousLocationInView(self.view)
            let lastDistance = distanceTowPoint(lastp1, withPoint: lastp2)
            
            if nowDistance - lastDistance > 0 {
                label.text = "放大"
            }else if nowDistance - lastDistance < 0 {
                label.text = "缩小"
            }else {
                label.text = "平移"
            }
            
        }

    }
    
    
    func distanceTowPoint(p1: CGPoint, withPoint p2: CGPoint) ->CGFloat {
        return sqrt(pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2))
        
    }


}

