//
//  ViewController.swift
//  UI10-task-02-swift
//
//  Created by keyzhang on 15/4/9.
//  Copyright (c) 2015年 keyzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data:NSArray!
    
    var scrollView: UIScrollView!
    
    var pageCtrl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tableView:UITableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        data = UIFont.familyNames()
        
        
        var widthm = tableView.frame.size.width
        var view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 200))
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: widthm, height: 200))
        scrollView.contentSize = CGSize(width: widthm * 5, height: 200)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        for index in 1...5 {
            var imgName = "image\(index).jpg"
            var imgView: UIImageView = UIImageView(image: UIImage(named: imgName))
            imgView.frame = CGRect(x: widthm * CGFloat(index - 1), y: 0, width: widthm, height: 200)
            scrollView.addSubview(imgView)
        }
        view.autoresizesSubviews = false
        view.addSubview(scrollView)
        
        pageCtrl = UIPageControl(frame: CGRect(x: 0, y: 200 - 20, width: widthm, height: 20))
        pageCtrl.addTarget(self, action: Selector("pageCtrlAction:"), forControlEvents: UIControlEvents.ValueChanged)
        pageCtrl.numberOfPages = 5
        pageCtrl.currentPage = 0
        view.addSubview(pageCtrl)
        
        tableView.tableHeaderView = view
        

        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        tableViewCell.textLabel?.text = self.data[indexPath.row] as? String
        
        return tableViewCell
    }
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            pageCtrl.currentPage = Int(scrollView.contentOffset.x/scrollView.frame.size.width)
        }
    }

    //MARK: pageCtrl Action
    func pageCtrlAction(pageCtrl: UIPageControl) {
//        scrollView.contentOffset.x = scrollView.frame.width * CGFloat(pageCtrl.currentPage)
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.width * CGFloat(pageCtrl.currentPage), y: 0), animated: true)
    }

}

