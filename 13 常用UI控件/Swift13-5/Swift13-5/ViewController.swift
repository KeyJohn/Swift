//
//  ViewController.swift
//  Swift13-5
//
//  Created by keyzhang on 15/7/29.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor()
        //风火轮
        self._initUIActivityIndicatorView()
        //页面控制器
        self._initPageControl()
        //进度条
        self._initProgress()

    }
    
    func _initUIActivityIndicatorView() {
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        activity.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        
        activity.backgroundColor = UIColor.blueColor()
        //开始转动
        activity.startAnimating()
        //停止转动并且隐藏
//        activity.stopAnimating()
        self.view.addSubview(activity)
        
    }
    
    func _initPageControl() {
        let pageControl = UIPageControl(frame: CGRect(x: 100, y: 200, width: 100, height: 20))
        pageControl.backgroundColor = UIColor.blueColor()
        //设置总页数
        pageControl.numberOfPages = 3
        //设置当前选中的页数,从0开始
        pageControl.currentPage = 2
        //添加点击事件
        pageControl.addTarget(self, action: "pageAction:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(pageControl)
    }
    
    func pageAction(pageControl: UIPageControl) {
        print("currentPage is \(pageControl.currentPage)")
    }
    
    func _initProgress() {
        let progress = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
        //设置进度值(0-1)
        progress.progress = 1
        //设置已经加载的进度条的颜色
        progress.progressTintColor = UIColor.orangeColor()
        
        //设置未加载的进度条的颜色
        progress.trackTintColor = UIColor.blueColor()
        progress.frame = CGRect(x: 10, y: 300, width: 300, height: 0)
        progress.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(progress)
        
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "progressAction:", userInfo: progress, repeats: true)
    }
    
    func progressAction(timer: NSTimer) {
        let progress = timer.userInfo as! UIProgressView
        progress.progress += 0.05
        if progress.progress == 1 {
            timer.invalidate()
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

