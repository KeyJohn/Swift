//
//  ViewController.swift
//  Swift17-3
//
//  Created by keyzhang on 15/8/9.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //创建表视图    也可以使用storyboard或者ib
    @IBOutlet weak var tableView: UITableView!
    
    var data: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //数据源
        self.data = UIFont.familyNames()
        
//
        /*---------------TableView的常用属性----------------------*/
        //设置头视图
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        tableHeaderView.backgroundColor = UIColor.grayColor()
        tableView.tableHeaderView = tableHeaderView
        
        //在头视图上添加一个按钮
        let btn = UIButton(type: UIButtonType.ContactAdd)
        btn.frame = CGRect(x: 100, y: 50, width: 30, height: 30)
        btn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        tableHeaderView.addSubview(btn)

        //设置尾视图
        let tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 200))
        tableFooterView.backgroundColor = UIColor.redColor()
        tableView.tableFooterView = tableFooterView
        
        //设置tableView单元格分割线样式
        //UITableViewCellSeparatorStyleNone表示没有分割线
//        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //设置分割线的颜色，默认是浅灰色
        tableView.separatorColor = UIColor.redColor()
        //设置表视图中每一个单元格的行高, 默认是44
//        tableView.rowHeight = 100
        
        
    }
    
    func buttonAction(btn: UIButton) {
//        //删除第一条数据
//        self.data.removeAtIndex(0)
//        //刷新tableView， 使视图与数组中的数据同步显示
//        self.tableView.reloadData()
        
//        //构建一个NSIndexPath
//        let indexPath = NSIndexPath(forRow: 2, inSection: 0)
//        //根据一个indexPath从tableview中拿到cell
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        cell?.textLabel?.text = "hehe"
        
        // 根据显示的cell，返回一组cell实例的数组，如果没有显示，返回nil
//        let array = tableView.visibleCells
//        for cell: UITableViewCell in array {
//            let cellText = cell.textLabel?.text
//            print(cellText)
//        }
        
        // 根据显示的cell，返回一组NSIndexPath实例的数组，如果没有显示，返回nil
//        let array = tableView.indexPathsForVisibleRows
//        for indexPath: NSIndexPath in array! {
//            print(indexPath.row)
//        }

        //滑动到指定的单元格
        let indexPath = NSIndexPath(forRow: 5, inSection: 0)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
    }

    //MARK: UITableViewDataSource
    //返回每一组单元格的数量
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let fontName = self.data[indexPath.row]
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 16)
        return cell
    }
    
    
    //MARK: UITableViewDelegate
    /*
    设置行高，可以根据索引值不同设置不同的行高
    */
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }else if indexPath.row == 1 {
            return 200
        }
        
        return 44
    }
    
    //将要显示cell时调用的方法
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.separatorInset = UIEdgeInsetsMake(-30, 0, 0, 5)
        tableView.layoutMargins = UIEdgeInsetsMake(-30, 0, 0, 5)
    }
    

}

