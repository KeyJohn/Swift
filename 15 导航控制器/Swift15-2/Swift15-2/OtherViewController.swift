//
//  OtherViewController.swift
//  Swift15-2
//
//  Created by keyzhang on 15/8/6.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(red: CGFloat(CGFloat(arc4random())%10 * 0.1), green: CGFloat(CGFloat(arc4random())%10 * 0.1), blue: CGFloat(CGFloat(arc4random())%10 * 0.1), alpha: 1)
        let viewControllers = self.navigationController?.viewControllers
        let count = viewControllers!.count
        self.title = "第\(count - 1)个控制器"
        
        print(self.navigationController?.topViewController)
        print(self)
        
        //创建push按钮
        let pushbtn = UIButton(type: UIButtonType.Custom)
        pushbtn.backgroundColor = UIColor.blackColor()
        pushbtn.setTitle("push", forState: UIControlState.Normal)
        pushbtn.frame = CGRectMake(100, 100, 100, 30)
        pushbtn.addTarget(self, action: "pushBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(pushbtn)
        
        //创建pop按钮
        let popbtn1 = UIButton(type: UIButtonType.Custom)
        popbtn1.tag = 100
        popbtn1.backgroundColor = UIColor.blackColor()
        popbtn1.setTitle("pop1", forState: UIControlState.Normal)
        popbtn1.frame = CGRectMake(100, 200, 100, 30)
        popbtn1.addTarget(self, action: "popBtn1Click:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(popbtn1)
        
        let popbtn2 = UIButton(type: UIButtonType.Custom)
        popbtn2.tag = 101
        popbtn2.backgroundColor = UIColor.blackColor()
        popbtn2.setTitle("pop2", forState: UIControlState.Normal)
        popbtn2.frame = CGRectMake(100, 300, 100, 30)
        popbtn2.addTarget(self, action: "popBtn1Click:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(popbtn2)
        
        let popbtn3 = UIButton(type: UIButtonType.Custom)
        popbtn3.tag = 102
        popbtn3.backgroundColor = UIColor.blackColor()
        popbtn3.setTitle("pop3", forState: UIControlState.Normal)
        popbtn3.frame = CGRectMake(100, 400, 100, 30)
        popbtn3.addTarget(self, action: "popBtn1Click:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(popbtn3)
        
    }
    
    func pushBtnClick(btn: UIButton) {
        let otherVC = OtherViewController()
        self.navigationController?.pushViewController(otherVC, animated: true)
    }
    
    func popBtn1Click(btn: UIButton) {
        if btn.tag == 100 {
            //pop1---直接返回上一级
            self.navigationController?.popViewControllerAnimated(true)
        }else if btn.tag == 101 {
            //pop2---返回首页
            self.navigationController?.popToRootViewControllerAnimated(true)
        }else if btn.tag == 102 {
            //pop3---返回指定界面
            let alertVC = UIAlertController(title: "提示", message: "请输入返回控制器的索引", preferredStyle: UIAlertControllerStyle.Alert)
            alertVC.addTextFieldWithConfigurationHandler({ (textField: UITextField) -> Void in
                textField.keyboardType = UIKeyboardType.NumberPad
                textField.textAlignment = .Center
            })
            let alertAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { (alertAction: UIAlertAction) -> Void in
                let textField = alertVC.textFields?.last
                
                
                if let indexStr = textField?.text {
                    //拿到当前导航控制器的子控制器个数
                    let count = self.navigationController?.viewControllers.count
                    let index = Int(indexStr)
                    if index >= count || index < 0 {
                        //不合法
                        print("输入错误")
                        return;
                    }
                    
                    //需要跳转到下标为index的控制器
                    let stepVC = self.navigationController!.viewControllers[index!] as UIViewController
                    self.navigationController?.popToViewController(stepVC, animated: true)
                    
                }
            })
            alertVC.addAction(alertAction)
            
            self.presentViewController(alertVC, animated: true, completion: nil)
        }
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
