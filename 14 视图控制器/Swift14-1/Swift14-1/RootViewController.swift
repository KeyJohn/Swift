//
//  RootViewController.swift
//  Swift14-1
//
//  Created by keyzhang on 15/8/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("这里是RootViewController的viewDidLoad方法")
        
        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        myView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(myView)
        
    }
    
    //调用loadView的时机
    //满足两个条件：
    //1、view属性的get访问器方法被调用的时候
    //2、view为空的时候
    //只有当以上两个条件同事满足的时候才会调用loadView方法
    override func loadView() {
        print("这里是loadView方法")
        let view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.yellowColor()
        self.view = view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
