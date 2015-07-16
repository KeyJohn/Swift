//
//  ViewController.swift
//  Swift10-4
//
//  Created by keyzhang on 15/7/16.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imgView = UIImageView(frame: CGRectMake(100, 100, 100, 100))
        imgView.backgroundColor = UIColor.redColor()
        self.view.addSubview(imgView)
        imgView.imageWithUrlStr("http://c.hiphotos.baidu.com/image/pic/item/7aec54e736d12f2ecbd3956e4dc2d562843568ed.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

