//
//  ViewController.swift
//  UI10-task-03-swift
//
//  Created by keyzhang on 15/4/9.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    
    var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var scrollView: UIScrollView = UIScrollView(frame: self.view.bounds)
        scrollView.delegate = self
        scrollView.maximumZoomScale = 3.0
        scrollView.minimumZoomScale = 1.0
        
        imgView = UIImageView(image: UIImage(named: "0.JPG"))
        imgView.frame = scrollView.bounds
        scrollView.addSubview(imgView)
        
        self.view.addSubview(scrollView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UIScrollViewDelegate
    //TODO: ForZooming
    //FIXME: hehe
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imgView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        println("\(scrollView.zoomScale)")
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView!) {
        println("BeginZooming")
    }
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        println("EndZooming")
    }
    


}

