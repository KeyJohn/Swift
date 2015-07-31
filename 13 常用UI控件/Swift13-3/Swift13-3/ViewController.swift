//
//  ViewController.swift
//  Swift13-3
//
//  Created by keyzhang on 15/7/27.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self._initImageView()
    }
    
    
    //MARK: 图像视图
    func _initImageView() {
        let image = UIImage(named: "scene1.jpg")
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 432/2, height: 324/2))
        imageView.backgroundColor = UIColor.redColor()
        imageView.image = image
        self.view.addSubview(imageView)
        
        //设置图片的高亮状态下显示的图片
//        imageView.highlightedImage = UIImage(named: "scene2.jpg")
//        imageView.highlighted = true
        
        //设置内容模式,可以防止图片比例被拉伸
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        var images = [UIImage]()
        for _index in 1...5 {
            let image = UIImage(named: "scene\(_index).jpg")
            images.append(image!)
        }
        
        //动画播放图片的集合
        imageView.animationImages = images
        //设置播放动画的持续时间
        imageView.animationDuration = 5
        //开始播放动画
        imageView.startAnimating()
        
        //imageView默认的触摸事件是关闭的,在imageView上添加视图默认是不接受任何事件的
        //打开触摸事件
        imageView.userInteractionEnabled = true
        
        let button = UIButton(type: UIButtonType.ContactAdd)
        button.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        imageView.addSubview(button)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

