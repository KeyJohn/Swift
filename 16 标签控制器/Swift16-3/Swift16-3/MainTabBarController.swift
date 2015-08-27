//
//  MainTabBarController.swift
//  UISwift16-3
//
//  Created by keyzhang on 15/8/9.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    
    var selectedImgView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //创建子视图
        self._initTabbarView()
        
        //创建子控制器
        self._initViewControllers()

    }
    
    //MARK: 创建子视图
    func _initTabbarView() {
        //定制自己的tabbar视图
        //隐藏tabbar工具栏
        self.tabBar.hidden = true
        
        //创建tabbar工具栏视图
        let tabbarView = UIImageView(frame: CGRect(x: 0, y: height - 49, width: width, height: 49))
        //打开接收点击事件
        tabbarView.userInteractionEnabled = true
        
        var img = UIImage(named: "navbg.png")
        UIGraphicsBeginImageContext(CGSizeMake(width, 49))
        img?.drawInRect(CGRectMake(0, 0, width, 49))
        img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tabbarView.image = img
        
        self.view.addSubview(tabbarView)
        
        //创建选项按钮
        let array = ["1.png","2.png","3.png","4.png","5.png"]
        for index in 0...array.count - 1 {
            let btn = UIButton(type: UIButtonType.Custom)
            btn.frame = CGRect(x: width / CGFloat(array.count) * CGFloat(index), y: 0, width: width / CGFloat(array.count), height: 49)
            btn.tag = 100 + index
            btn.setImage(UIImage(named: array[index]), forState: UIControlState.Normal)
            btn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            tabbarView.addSubview(btn)
        }
        
        selectedImgView = UIImageView(image: UIImage(named: "选中.png"))
        selectedImgView.frame = CGRect(x: (width / CGFloat(array.count) - 53)/2, y: (49 - 45)/2, width: 53, height: 45)
        
        tabbarView.addSubview(selectedImgView)
    }
    
    func buttonAction(btn: UIButton) {
        //通过修改selectedIndex,实现子控制器之间的切换显示
        self.selectedIndex = btn.tag - 100
        self.selectedIndex = Int(btn.center.x/(width/5))
        //选中视图移动的动画效果
        UIView.animateWithDuration(0.3) { () -> Void in
            self.selectedImgView.center = btn.center
        }
    }
    
    //MARK: 创建子控制器
    func _initViewControllers() {
        let home = HomeViewController()
        let message = MessageViewController()
        let search = SearchViewController()
        let setting = SettingViewController()
        let more = MoreViewController()
        let viewControllers = [home, message, search, setting, more]
        self.viewControllers = viewControllers
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
