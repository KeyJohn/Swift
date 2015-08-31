//
//  ViewController.swift
//  Swift17-2
//
//  Created by keyzhang on 15/8/9.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data: [[String]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        //设置填充量
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        //拿到数据
        let path = NSBundle.mainBundle().pathForResource("font", ofType: "plist")
        //通过一个文件路径，获取文件路径下的数组文件
        let array = NSArray(contentsOfFile: path!)
        self.data = array as! [[String]]
    }
    
    //MARK: UITableViewDataSource
    //返回的组的数量,如果没有实现，默认返回1组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.data.count
    }
    
    //返回每一组单元格的数量
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let fontName = self.data[indexPath.section][indexPath.row]
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 16)
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "第\(section)组"
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

