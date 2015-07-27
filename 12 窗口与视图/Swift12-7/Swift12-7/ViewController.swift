//
//  ViewController.swift
//  Swift12-7
//
//  Created by keyzhang on 15/7/26.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        02、做一个宽20，高20，红黑相间的棋盘（UIView）
        */
        
        for row in 0...14 {
            for colum in 0...9 {
                let itemView = UIView(frame: CGRect(x: 20 * colum + 100, y: 20 * row + 100, width: 20, height: 20))
                self.view.addSubview(itemView)
                
//                if row % 2 == 0 {   //行索引是偶数
//                    if colum % 2 == 0 {
//                        itemView.backgroundColor = UIColor.redColor()
//                    }else {
//                        itemView.backgroundColor = UIColor.blackColor()
//                    }
//                } else {
//                    if colum % 2 == 0 {
//                        itemView.backgroundColor = UIColor.blackColor()
//                    }else {
//                        itemView.backgroundColor = UIColor.redColor()
//                    }
//                }
                
                if (row + colum) % 2 == 0 {
                    itemView.backgroundColor = UIColor.redColor()
                }else {
                    itemView.backgroundColor = UIColor.blackColor()
                }
            }
        }
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

