//
//  GHNibLoadable.swift
//  GHBaseModule_Example
//
//  Created by haoguanhao on 08/10/2018.
//  Copyright (c) 2018 haoguanhao. All rights reserved.
//

import UIKit

// 面向协议的开发 POP 使用面向协议实现多继承
protocol GHNibLoadable {
    
}
// 只能在UIView的类型中使用（约束）
extension GHNibLoadable where Self : UIView {
    // Self 表示当前类的对象 协议类方法用 static 修饰
    static func loadFromNib(_ nibname : String? = nil) -> Self {
        // self返回本身view
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}

