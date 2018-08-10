//
//  NSDate+Extension.swift
//  BKBasicTools
//
//  Created by Tinghui Yuan on 2018/1/22.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

public extension Date {
    
    /// Date转成时间戳
    ///
    /// - Parameter date: 传入Date
    /// - Returns: 返回时间戳
    public static func getTimestamp(_ date: Date) -> Int {
        let timeInterval: TimeInterval = date.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return timeStamp
    }
    
    
    /// 时间转时间戳
    ///
    /// - Parameters:
    ///   - dateStr: 时间字符串(2016年05月15日 00:00:00)
    ///   - formatterStr: 时间格式(yyyy年MM月dd日 HH:mm:ss)
    /// - Returns: 返回时间戳
    public static func getTimestamp(dateStr: String, formatterStr: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatterStr
        guard let date = dateFormatter.date(from: dateStr) else {
            return nil
        }
        let dateInterval = date.timeIntervalSince1970
        let dateStamp = Int(dateInterval)
        return dateStamp
    }
    
    
    /// 时间戳根据格式转换为对应的字符串
    ///
    /// - Parameters:
    ///   - timeStamp: 时间戳参数
    ///   - formatterStr: 时间日期格式参数
    /// - Returns: 返回转换完成的时间字符串
    public static func getDate(timeStamp: Int, formatterStr: String) -> String {
        let timeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatterStr
        let time = dateFormatter.string(from: date)
        return time
    }
}
