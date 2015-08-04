//
//  ViewController.swift
//  Swift13-7
//
//  Created by keyzhang on 15/8/2.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /***************火焰图片Demo*******************/

    var imgView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        imgView = UIImageView(frame: CGRect(x: 20, y: 100, width: screenWidth - 20 * 2, height: screenWidth - 20 * 2))
        imgView!.backgroundColor = UIColor.redColor()
        self.view.addSubview(imgView!)
        
        var imgs:[UIImage] = []
        for index in 1...17 {
            let imgName = NSString(format: "campfire%02d.gif", index)
            if let img:UIImage = UIImage(named: imgName as String) {
                imgs.append(img)
            }
        }
        
        imgView?.animationImages = imgs
        imgView?.animationDuration = 1
        imgView?.startAnimating()
        
        let slider = UISlider(frame: CGRect(x: 20, y: 100 + imgView!.frame.size.height + 50, width: imgView!.frame.size.width, height: 30))
        slider.value = 0.5
        slider.addTarget(self, action: "sliderAction:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider)
        
    }
    
    func sliderAction(slider: UISlider) {
        imgView?.animationDuration = NSTimeInterval(slider.value * 2)
        imgView?.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

