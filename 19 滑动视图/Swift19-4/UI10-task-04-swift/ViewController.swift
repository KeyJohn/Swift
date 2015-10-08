//
//  ViewController.swift
//  UI10-task-04-swift
//
//  Created by keyzhang on 15/4/7.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate{

    var scrollView: UIScrollView?
    
    var images: NSMutableArray = NSMutableArray(capacity: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "图片浏览"
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        scrollView = UIScrollView(frame: self.view.bounds)
        self.view.addSubview(scrollView!)
        
        //不显示滚动条
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.showsVerticalScrollIndicator = false
        //设置分页显示
        scrollView?.pagingEnabled = true
        //设置背景颜色
        scrollView?.backgroundColor = UIColor.redColor()
        
        //设置内容视图大小
        scrollView?.contentSize = CGSize(width: self.view.frame.size.width * 5, height: self.view.frame.size.height)
        scrollView?.delegate = self
        
        //加载图片
        for index in 0...5 {
            var image: UIImage! = UIImage(named: "\(index).JPG")
            //            var imageView: UIImageView! = UIImageView(image: image)
            //            imageView.frame = CGRect(x: self.view.frame.size.width * CGFloat(index), y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            //            self.images.addObject(imageView)
            var photoScrollView:PhotoScrollView! = PhotoScrollView(frame: CGRect(x: self.view.frame.size.width * CGFloat(index), y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
            photoScrollView.tag = 200+index
            photoScrollView.backgroundColor = UIColor(red:0.4, green: 1, blue: 1, alpha: 1)
            photoScrollView.image = image
            self.scrollView?.addSubview(photoScrollView)
        }
        
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var currentIndex = Int(scrollView.contentOffset.x/self.view.bounds.width)
        if currentIndex != index {
            var photoScrollView = scrollView.viewWithTag(200+index) as PhotoScrollView;
            //还原比例大小
            photoScrollView.setZoomScale(1, animated: false)
        }
        index = currentIndex
    }
    
    var index:NSInteger = 0

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

