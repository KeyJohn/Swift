//
//  main.swift
//  Swift09-3
//
//  Created by keyzhang on 15/7/13.
//  Copyright © 2015年 keyzhang. All rights reserved.
//

import Foundation

//当闭包捕获自身引用，并且同时销毁的时候，就会导致循环引用。
class BlockClass {
    let blockName: String
    let bValue: String?
    lazy var customBlock: () -> String = {
//        if let text = self.bValue { //此处在闭包中使用了自身的引用，自己持有自己，产生循环引用
//            return "\(self.blockName)---\(text)"
//        } else {
//            return "text is nil"
//        }
        
        //使用无主引用解决引用循环
        //此处使用无主引用来捕获自己，而不是强引用
        [unowned self] in
        if let text = self.bValue {
            return "\(self.blockName)---\(text)"
        } else {
            return "text is nil"
        }
    }
    
    init(blockName: String, bValue: String?){
        self.blockName = blockName
        self.bValue = bValue
        print("Init Method")
    }
    
    deinit {
        print("deinit")
    }
}


var blockClass: BlockClass? = BlockClass(blockName: "name", bValue: "hehe")
print(blockClass!.customBlock())
blockClass = nil    //设置为nil后观察deinit方法是否调用，如果没调用，表示实例没有被释放


