//
//  ImageViewLoader.swift
//  Swift10-4
//
//  Created by keyzhang on 15/7/16.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit
extension UIImageView {
    func imageWithUrlStr(urlstr: String) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            let data = NSData(contentsOfURL: NSURL(string: urlstr)!)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.image = UIImage(data: data!)
            })
        }
    }
}

