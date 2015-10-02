//
//  ViewController.swift
//  UI10-task-01-swift
//
//  Created by keyzhang on 15/4/9.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建滑动视图
        let scrollView: UIScrollView = UIScrollView(frame: CGRect(x: 50, y: 50, width: 300, height: 200))
        scrollView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(scrollView)
        
        //创建子视图
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        view1.backgroundColor = UIColor.redColor()
        scrollView.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: 0, y: 200, width: 300, height: 200))
        view2.backgroundColor = UIColor.greenColor()
        scrollView.addSubview(view2)
        
        //设置内容的尺寸
        scrollView.contentSize = CGSize(width: 300, height: 200*2)
        
//        //scrollView的常用属性
//        //滚动时是否显示水平滚动条
//        scrollView.showsHorizontalScrollIndicator = false
//        //滚动时是否显示垂直滚动条
//        scrollView.showsVerticalScrollIndicator = false
//        //设置滚动条的样式,基本颜色有3种： 默认、黑色、白色
//        scrollView.indicatorStyle = UIScrollViewIndicatorStyle.White
//        
//        //滚动开始、末尾的位置，是否加上反弹效果
//        scrollView.bounces = false
//        //设置滚动的偏移量
////        scrollView.contentOffset = CGPoint(x: 0, y: 50)
//        //设置是否分页
//        scrollView.pagingEnabled = true
//        //是否开启滚动
////        scrollView.scrollEnabled = false
        //设置代理对象
        scrollView.delegate = self;
    }
    
    //MARK:- UIScrollViewDelegate
    //滑动视图滑动时调用,不断地调用
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let f = scrollView.contentOffset.y
        print("f is \(f)")
    }
    
    //开始拖动的时候调用。
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("BeginDragging")
    }
    
    //结束拖动---> 手指离开屏幕
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("EndDragging")
        if decelerate {
            print("WillBegin decelerate")
        }else {
            print("Stop")
        }
    }
    //scrollView开始减速
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        print("BeginDecelerating")
    }
    
    //scrollView减速停止
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("EndDecelerating")
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

