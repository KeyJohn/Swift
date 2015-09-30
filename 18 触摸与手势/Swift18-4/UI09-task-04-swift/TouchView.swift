//
//  TouchView.swift
//  UI09-task-04-swift
//
//  Created by keyzhang on 15/4/10.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class TouchView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesBegan")
    }
    

}
