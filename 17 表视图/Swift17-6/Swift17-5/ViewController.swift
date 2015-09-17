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
    
    var lastindexPath: NSIndexPath = NSIndexPath(forRow: -1, inSection: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView(frame: self.view.bounds, style: .Plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .None
        
        self.view.addSubview(tableView)
        
        data = UIFont.familyNames()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var identifier = ""
        if indexPath.row == 0 {
            identifier = "cell-0"
        }else if (indexPath.row == self.data.count - 1) {
            identifier = "cell-last"
        }else {
            identifier = "cell"
        }
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            
            if indexPath.row == 0 {
                cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
                let backgroundView = UIImageView(image: UIImage(named: "tableCell_top.png"))
                cell?.backgroundView = backgroundView

                //设置选中后的背景视图
                let selectedBackgroundView = UIImageView(image: UIImage(named: "tableCell_head_tapped.png"))
                cell?.selectedBackgroundView = selectedBackgroundView
                
                cell?.textLabel?.highlightedTextColor = UIColor.yellowColor()

            }else if (indexPath.row == self.data.count - 1) {
                cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
                let backgroundView = UIImageView(image: UIImage(named: "tableCell_bottom.png"))
                cell?.backgroundView = backgroundView
                
                //设置选中后的背景视图
                let selectedBackgroundView = UIImageView(image: UIImage(named: "tableCell_bottom_tapped.png"))
                cell?.selectedBackgroundView = selectedBackgroundView
                
                cell?.textLabel?.highlightedTextColor = UIColor.greenColor()
            }else {
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
            }
        }
        
        cell?.textLabel?.text = self.data[indexPath.row]
        
        if indexPath.row == lastindexPath.row {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else {
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell!
    }
    
    //点击某个单元格触发的方法
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消上一次选中的单元格
        let lastcell = tableView.cellForRowAtIndexPath(self.lastindexPath)
        lastcell?.accessoryType = UITableViewCellAccessoryType.None
        
        
        //设置单元格打勾
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
        
        
        //记录当前的单元格
        lastindexPath = indexPath
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

