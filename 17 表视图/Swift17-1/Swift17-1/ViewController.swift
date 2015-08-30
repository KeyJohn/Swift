//
//  ViewController.swift
//  Swift17-1
//
//  Created by keyzhang on 15/8/9.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var familyNames: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建表视图对象
        let tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        //让自身实现tableView的代理协议
        tableView.delegate = self
        //让自身实现tableView的数据源协议
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.redColor()
        self.view.addSubview(tableView)
        
        //初始化数据
        familyNames = UIFont.familyNames()
        
    }
    
    //MARK: UITableViewDataSource
    //在一组中有多少个单元格
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return familyNames.count
    }
    
    //每一个单元格是什么
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = familyNames[indexPath.row]
        cell.textLabel!.font = UIFont(name: familyNames[indexPath.row], size: 16);
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

