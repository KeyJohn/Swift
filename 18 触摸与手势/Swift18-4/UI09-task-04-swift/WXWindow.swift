//
//  WXWindow.swift
//  UI09-task-04-swift
//
//  Created by keyzhang on 15/4/10.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class WXWindow: UIWindow {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    /*
    window分发事件时会调用此方法
    此方法会被UIApplication调用，UIApplication将事件分发给weindow
    */
    override func sendEvent(event: UIEvent) {
        print("sendEvent")
        super.sendEvent(event)
    }

}
