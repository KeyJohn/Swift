//
//  ViewController.swift
//  Swift14-4
//
//  Created by keyzhang on 15/8/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnClick(sender: UIButton) {
        
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("detailVC")
        
        //设置弹出的动画效果
        /*enum UIModalTransitionStyle : Int {
        
        case CoverVertical
        case FlipHorizontal
        case CrossDissolve
        @available(iOS 3.2, *)
        case PartialCurl
        }
*/
        detailVC.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        //弹出模态视图
        self.presentViewController(detailVC, animated: true, completion: nil)
    }
    
    //视图将要添加到父视图上显示的时候
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Root viewWillAppear")
    }
    
    //视图已经添加到父视图上显示
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("Root viewDidAppear")
    }
    
    //将要消失
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("Root viewWillDisappear")
    }
    
    //已经消失
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("Root viewDidDisappear")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

