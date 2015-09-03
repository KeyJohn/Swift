//
//  ViewController.swift
//  Swift17-5
//
//  Created by keyzhang on 15/9/4.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView(frame: self.view.bounds, style: .Plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        data = UIFont.familyNames()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
            
            //设置cell的背景视图
            //背景视图的frame无需设置，作为背景frame和cell一样
            let backgroundView = UIImageView(image: UIImage(named: "tableCell_common.png"))
            cell?.backgroundView = backgroundView
            
            //设置cell的选中样式
            /*
            UITableViewCellSelectionStyleNone,
            UITableViewCellSelectionStyleBlue,
            UITableViewCellSelectionStyleGray,
            UITableViewCellSelectionStyleDefault NS_ENUM_AVAILABLE_IOS(7_0)
            
            */
//            cell?.selectionStyle = .None;
            
            //设置选中后的背景视图
            let selectedBackgroundView = UIImageView(image: UIImage(named: "tableCell_common_tapped.png"))
            cell?.selectedBackgroundView = selectedBackgroundView
            
            //设置高亮选中
            //单元格选中后，hightlighted就会被设置成YES，而且它的子视图如果有hightlighted属性，也会被设为YES
            cell?.textLabel?.highlightedTextColor = UIColor.redColor()
            
            
            //设置辅助视图
            /*
            UITableViewCellAccessoryNone,                   // don't show any accessory view
            UITableViewCellAccessoryDisclosureIndicator,    // regular chevron. doesn't track
            UITableViewCellAccessoryDetailDisclosureButton, // info button w/ chevron. tracks
            UITableViewCellAccessoryCheckmark,              // checkmark. doesn't track
            UITableViewCellAccessoryDetailButton NS_ENUM_AVAILABLE_IOS(7_0) // info button. tracks
            */
//            cell?.accessoryType = .Checkmark
            
            //自定义辅助视图
            let accessoryView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
            accessoryView.backgroundColor = UIColor.greenColor()
            cell?.accessoryView = accessoryView
            
        }
        
        cell?.textLabel?.text = self.data[indexPath.row]
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

