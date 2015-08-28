//
//  ThemeViewController.swift
//  Swift16-5
//
//  Created by keyzhang on 15/8/9.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {

    
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    
    var checkImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "我的主题";
        
        
        //设置视图的背景颜色
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backcolor")!);
        
        let topImg = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: 160))
        topImg.image = UIImage(named: "topbg")
        self.view.addSubview(topImg)
        
        checkImg = UIImageView(image: UIImage(named: "checkmark.png"))
        
        //循环创建按钮
        for index in 0...7 {
            let btn = UIButton(type: UIButtonType.Custom)
            btn.tag = 100 + index
            btn.setBackgroundImage(UIImage(named: "\(index+1).png"), forState: UIControlState.Normal)
            btn.addTarget(self, action: "actionClick:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(btn)
            
            
            if index % 2 == 0 { //偶数
                btn.frame = CGRect(x: (width/2 - 160)/2, y: CGFloat(180 + 80*Int((CGFloat(index) / 2))), width: 160, height: 62)
            }else {
                btn.frame = CGRect(x: (width/2 - 160)/2 + width/2, y: CGFloat(180 + 80*Int((CGFloat(index) / 2))), width: 160, height: 62)
            }
            
            if index == 0 { //处理选择图片
                checkImg.frame = CGRectMake(CGRectGetMaxX(btn.frame) - 20, CGRectGetMaxY(btn.frame) - 20, 36/2, 36/2);
            }
        }
        
        self.view.addSubview(checkImg)

    }
    
    func actionClick(btn: UIButton) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.checkImg.frame = CGRectMake(CGRectGetMaxX(btn.frame) - 20, CGRectGetMaxY(btn.frame) - 20, 36/2, 36/2);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = false;
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black;

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController!.navigationBar.barStyle = UIBarStyle.Default;
        
        self.navigationController!.navigationBar.translucent = true;

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
