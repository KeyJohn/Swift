//
//  MyView.swift
//  UI09-task-01-swift
//
//  Created by keyzhang on 15/4/9.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class MyView: UIView {

    var lView:UIView!
    
    var time:NSTimer!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //开启多点触控
        self.multipleTouchEnabled = true
        
        
        lView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
        lView.backgroundColor = UIColor.yellowColor();
        self.addSubview(lView)
        

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during ansimation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    //开始点击时，调用的方法
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //        println(count)
        //拿到一个UITouch对象
//        let touch:UITouch = touches.anyObject() as! UITouch;
        let touch = touches.first as UITouch!
        //拿到点击次数
        let tapCount = touch.tapCount;
        if (tapCount == 1) {
            //单击
            //            singleTap()
            //使用定时器延时调用
            time = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector:"singleTap", userInfo: nil, repeats: false)
            
        } else {
            //终止定时器
            time.invalidate()
            doubleTap()
            
        }

    }
    
    func singleTap() {
        print("单击")
    }
    
    func doubleTap() {
        print("双击")
    }
    
    //触摸移动时，调用的方法
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        var touch = touches.anyObject() as! UITouch
        let touch = touches.first as UITouch!
        
        let location = touch.locationInView(self)
        //        println("location: \(location.x), \(location.y), \(location)")
        
        let lastLocation = touch.previousLocationInView(self)
        //        println("lastLocation: \(lastLocation.x), \(lastLocation.y), \(lastLocation)")
        
        let sub = location.x - lastLocation.x
        if sub > 0 {
            print("right")
        }else if sub < 0 {
            print("left")
        }else {
            print("move")
        }
        
        //让小矩形跟着手势移动
        //        lView.center = location
        lView.frame.origin = location


    }
    

    

}
