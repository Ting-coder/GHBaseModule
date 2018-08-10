//
//  GHLogTool.swift
//  GHBaseModule_Example
//
//  Created by haoguanhao on 08/10/2018.
//  Copyright (c) 2018 haoguanhao. All rights reserved.
//

import Foundation

// 复杂打印，带时间和线程
func gh_log<T>(_ message:T, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        print("")
        print("----LOGBEGAN--- \(fileName): \(line) \(function)--------")
        print("\(dateString) \(message)")
        print("当前线程：\(Thread.current)")
        print("----LOGEND-----")
        
    #endif
}

// 简单打印，带时间
func log<T>(_ msg : T) {
    #if DEBUG
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        
        print("\(dateString) : \(msg)")
    #endif
}
