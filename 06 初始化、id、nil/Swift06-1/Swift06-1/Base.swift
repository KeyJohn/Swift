//
//  Base.swift
//  Swift06-1
//
//  Created by keyzhang on 15/7/8.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Cocoa

class Base: NSObject {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    
    
    deinit {
        print("base - deinit")
    }
}
