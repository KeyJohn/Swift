//
//  ViewController.swift
//  Swift13-4
//
//  Created by keyzhang on 15/7/27.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //滑块
        self._initSlider()
        
        //开关
        self._initSwitch()
        
    }
    
    //MARK: 滑块
    func _initSlider() {
        //UIslider高度是固定的
        let slider = UISlider(frame: CGRect(x: 10, y: 100, width: 300, height: 30))
        slider.backgroundColor = UIColor.redColor()
        self.view.addSubview(slider)
        
        //设置滑动的最大值和最小值
        slider.maximumValue = 100
        slider.minimumValue = 0
        //设置初始值
        slider.value = 50
        
        //设置左边滑动条的图片 跟状态绑定
        var image1 = UIImage(named: "com_slider_max_l-Decoded.png")
        var image2 = UIImage(named: "com_slider_max_r-Decoded.png")
        
        //设置图片拉伸的点 (两种方法)
//        image1 = image1?.stretchableImageWithLeftCapWidth(5, topCapHeight: 0)
//        image2 = image2?.stretchableImageWithLeftCapWidth(5, topCapHeight: 0)
        image1 = image1?.resizableImageWithCapInsets(UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4))
        image2 = image2?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 4, 0, 4))
        
        slider.setMinimumTrackImage(image1, forState: UIControlState.Normal)
        slider.setMaximumTrackImage(image2, forState: UIControlState.Normal)
        
        //设置滑块按钮的颜色
        //需要在设置好自定义的图片时候才能设置
//        slider.thumbTintColor = UIColor.blueColor()
        //设置滑块的图片
        let image3 = UIImage(named: "com_thumb_max_n-Decoded.png")
        let image4 = UIImage(named: "com_thumb_max_h-Decoded.png")
        slider.setThumbImage(image3, forState: UIControlState.Normal)
        slider.setThumbImage(image4, forState: UIControlState.Highlighted)
        //添加事件
        slider.addTarget(self, action: "sliderAction:", forControlEvents: UIControlEvents.ValueChanged)

        
    }
    
    //MARK: Slider Action
    func sliderAction(slider: UISlider) {
        print("slider value is \(slider.value)")
    }
    
    
    //MARK: 开关
    func _initSwitch() {
        
        //宽高是固定的
        let switchUI = UISwitch(frame: CGRect(x: 10, y: 200, width: 100, height: 0))
        //设置默认开
//        switchUI.on = true
        //设置开、关，并且添加动画效果
//        switchUI.setOn(true, animated: false)
        switchUI.addTarget(self, action: "switchAction:", forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(switchUI)
        
    }
    
    //MARK: SwitchUI Action
    func switchAction(switchUI: UISwitch) {
        print("slider value is \(switchUI.on)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

