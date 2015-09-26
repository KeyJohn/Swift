//
//  ViewController.swift
//  UI09-task-01-swift
//
//  Created by keyzhang on 15/4/9.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myView: MyView = MyView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        myView.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(myView)
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

