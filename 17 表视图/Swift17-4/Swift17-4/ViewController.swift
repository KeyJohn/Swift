//
//  ViewController.swift
//  Swift17-4
//
//  Created by keyzhang on 15/9/3.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data: [[String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        //数据源
        let resourcePath = NSBundle.mainBundle().pathForResource("font", ofType: "plist")
        self.data = NSArray(contentsOfFile: resourcePath!)! as! [[String]]
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
        }
        
        cell?.textLabel?.text = self.data[indexPath.section][indexPath.row]
        
        return cell!
        
    }
    
    //section的头视图标题
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "第\(section)个组的头视图"
//    }
//    
//    //section的尾视图标题
//    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "第\(section)个组的尾视图"
//    }

    //自定义头视图
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //让headerView作为组的头视图，不需要设置headerView的frame，但是一定要指定高度
        let headerView = UIView(frame: CGRectZero)
        headerView.backgroundColor = UIColor.grayColor()
        let titleLabel = UILabel(frame: CGRect(x: 130, y: 10, width: 150, height: 20))
        titleLabel.font = UIFont.boldSystemFontOfSize(16)
        titleLabel.textColor = UIColor.greenColor()
        titleLabel.text = "第\(section)个组的头视图"
        headerView.addSubview(titleLabel)
        
        return headerView
        
    }
    
    //自定义尾部视图
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectZero)
        footerView.backgroundColor = UIColor.darkGrayColor()
        let titleLabel = UILabel(frame: CGRect(x: 130, y: 40, width: 150, height: 20))
        titleLabel.font = UIFont.boldSystemFontOfSize(16)
        titleLabel.textColor = UIColor.redColor()
        titleLabel.text = "第\(section)个组的尾视图"
        footerView.addSubview(titleLabel)
        
        return footerView

    }
    
    //指定组的尾部视图的高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    //指定组的头视图的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

