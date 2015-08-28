//
//  MainTabBarController.swift
//  Swift16-5
//
//  Created by keyzhang on 15/8/9.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UINavigationControllerDelegate {
    
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    
    var tabbarView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //创建自定义标签工具视图
        self._initTabbar()
        
        //设置代理
        for nav:UINavigationController in self.viewControllers as! [UINavigationController] {
            nav.delegate = self;
        }
    }
    
    func _initTabbar() {
        
        self.tabBar.hidden = true
        
        tabbarView = UIImageView(frame: CGRect(x: 0, y: height - 49, width: width, height: 49))
        tabbarView.userInteractionEnabled = true
        
        var img = UIImage(named: "mask_navbar.png")
        UIGraphicsBeginImageContext(CGSizeMake(width, 49))
        img?.drawInRect(CGRectMake(0, 0, width, 49))
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tabbarView.image = img
        
        self.view.addSubview(tabbarView)

        //创建按钮
        let arrowImg = UIImageView(image: UIImage(named: "home_bottom_tab_arrow"))
        arrowImg.tag = 123
        arrowImg.frame = CGRect(x: 0, y: 0, width: 64, height: 45)
        tabbarView.addSubview(arrowImg)
        
        let imgNames = ["home_tab_icon_1.png","home_tab_icon_2.png","home_tab_icon_3.png","home_tab_icon_4.png","home_tab_icon_5.png"]
        for index in 0...imgNames.count - 1 {
            let imgName = imgNames[index]
            let btn = UIButton(type: UIButtonType.Custom)
            btn.tag = 100 + index
            btn.showsTouchWhenHighlighted = true
            btn.setImage(UIImage(named: imgName), forState: UIControlState.Normal)
            btn.frame = CGRect(x: width / CGFloat(imgNames.count) * CGFloat(index), y: 0, width: width / CGFloat(imgNames.count), height: 49)
            if index == 0 {
                arrowImg.center = btn.center
            }
            btn.addTarget(self, action: "selectedClick:", forControlEvents: UIControlEvents.TouchUpInside)
            tabbarView.addSubview(btn)
        }
        
    }
    
    func selectedClick(btn: UIButton) {
        self.selectedIndex = btn.tag - 100;
        
        //动画-移动
        let arrowImg = tabbarView.viewWithTag(123)
        UIView.animateWithDuration(0.3) { () -> Void in
            arrowImg?.center = btn.center
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UINavigationControllerDelegate
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        
        if navigationController.viewControllers.count == 2 {
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                tabbarView?.frame.origin.x = -self.width
            })
        }else if navigationController.viewControllers.count == 1 {
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                tabbarView?.frame.origin.x = 0
            })
        }

    }


}
