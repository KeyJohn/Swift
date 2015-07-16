//
//  SingleDemo.swift
//  Swift10-3
//
//  Created by keyzhang on 15/7/16.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Cocoa

class SingleDemo: NSObject {
    
    var name: String?
    
    //单例
    class var shareSingleDemo: SingleDemo {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: SingleDemo? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SingleDemo()
        }
        return Static.instance!
    }

}
