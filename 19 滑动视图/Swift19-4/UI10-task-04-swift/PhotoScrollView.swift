//
//  PhotoScrollView.swift
//  UI10-task-04-swift
//
//  Created by keyzhang on 15/4/8.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class PhotoScrollView: UIScrollView, UIScrollViewDelegate {
    var _image:UIImage!
    var image:UIImage! {
        get {
            return self._image
        }
        set {
            _image = newValue
            var imgView:UIImageView = self.viewWithTag(100) as UIImageView
            imgView.backgroundColor = UIColor.greenColor()
            imgView.image = image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var imgView:UIImageView! = UIImageView(frame: self.bounds)
        imgView.tag = 100
        self.addSubview(imgView)
        
        //取消滑动条
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.delegate = self
        
        //设置最大、最小缩放比例
        self.maximumZoomScale = 3
        self.minimumZoomScale = 1
        
    }
 
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.viewWithTag(100)
    }
    
    
}


