//
//  PersonOperation.swift
//  Swift10-2
//
//  Created by keyzhang on 15/7/16.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import UIKit

class PersonOperation: NSOperation {
    
    override func main() {
        for index in 0...100 {
            print("main线程---\(index)")
        }
    }

}
