//
//  String+Extension.swift
//  eightThousandPoints
//
//  Created by blue on 2017/7/31.
//  Copyright © 2017年 bluajack. All rights reserved.
//

import UIKit

public extension String{
    
    // 年 月 日 时 分 秒 毫秒
    enum DateStringType {
        case yearMonthDay
        case yearMonth
        case monthDay
        case hoursMinuteSecond
        case hourMinute
        case yearMonthDayHoursMinuteSecond
        case monthDayHoursMinuteSecond
        case monthDayHoursMinute
    }
    
    
    /// 将self转换为你想要的字符串日期格式
    ///
    /// - Parameters:
    ///   - type: 输出日期格式
    ///   - dateFormat: self的日期格式
    ///   - segmentMode: 中间需要什么样的分隔符
    /// - Returns: 返回字符串
    public func dateStrSwitchToFormateStr(type: DateStringType, dateFormat: String, segmentMode: String = "") -> String? {
        var str: String?
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        if let date = formatter.date(from: self) {
            let c = Calendar.current
            let year = c.component(.year, from: date)
            let month = c.component(.month, from: date)
            let day = c.component(.day, from: date)
            let hour = c.component(.hour, from: date)
            let minute = c.component(.minute, from: date)
            let second = c.component(.second, from: date)
            
            let monthStr = month < 10 ? "0\(month)" : "\(month)"
            let dayStr = day < 10 ? "0\(day)" : "\(day)"
            let hourStr = hour < 10 ? "0\(hour)" : "\(hour)"
            let minuteStr = minute < 10 ? "0\(minute)" : "\(minute)"
            let secondStr = second < 10 ? "0\(second)" : "\(second)"
            
            switch type {
                case .yearMonthDay:
                    str = "\(year)\(segmentMode)\(monthStr)\(segmentMode)\(dayStr)"
                case .yearMonth:
                    str = "\(year)\(segmentMode)\(monthStr)"
                case .monthDay:
                    str = "\(monthStr)\(segmentMode)\(dayStr)"
                case .hoursMinuteSecond:
                    str = "\(hourStr):\(minuteStr):\(secondStr)"
                case .hourMinute:
                    str = "\(hourStr):\(minuteStr)"
                case .yearMonthDayHoursMinuteSecond:
                    str = "\(year)\(segmentMode)\(monthStr)\(segmentMode)\(dayStr) \(hourStr):\(minuteStr):\(secondStr)"
                case .monthDayHoursMinuteSecond:
                    str = "\(monthStr)\(segmentMode)\(dayStr) \(hourStr):\(minuteStr):\(secondStr)"
                case .monthDayHoursMinute:
                    str = "\(monthStr)\(segmentMode)\(dayStr) \(hourStr):\(minuteStr)"
            }
        }
        return str
    }
    
    
    
    /**
     * 返回年月字符串 20160901|2016-09-01
     */
    public func dateYearMonthDay(dateFormat: String, segmentMode: String?) -> String?{
        var str: String?
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        if let date = formatter.date(from: self) {
            let c = Calendar.current
            let year = c.component(.year, from: date)
            let month = c.component(.month, from: date)
            let day = c.component(.day, from: date)
            if let segmentMode = segmentMode {
                str = "\(year)\(segmentMode)\(month)\(segmentMode)\(day)"
            }else {
                str = "\(year)\(month)\(day)"
            }
            
        }
        return str
    }
    
    /**
     * 计算字符串长度
     */
    public func sizeWithText(font: UIFont, size: CGSize) -> CGRect {
        let attributes = [NSAttributedStringKey.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect;
    }
    
    
    /**
     *  先要使用的时候比较简便，如 “wxlo”.docunDir  "wxlo".cacheDir
     */
    public func docDir() -> String
    {
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        let filePath = docPath.appendingPathComponent((self as NSString).lastPathComponent)
        return filePath
    }
    //获取cache目录
    public func cacheDir() -> String
    {
        let cache = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        let filePath = cache.appendingPathComponent((self as NSString).lastPathComponent)
        return filePath
    }
    //获取临时目录
    public func tempDir() -> String
    {
        let temp = NSTemporaryDirectory() as NSString
        let filePath = temp.appendingPathComponent((self as NSString).lastPathComponent)
        return filePath
    }
    
    // MARK:- 正则验证
    // 输入只能为数字
    public func onlyInputTheNumber() -> Bool {
        return self.validate(value:"[0-9]*")
    }
    
    public func validate(value: String) -> Bool{
        let predicate = NSPredicate(format: " SELF MATCHES %@" , value)
        return predicate.evaluate(with: self)
    }
    
    public func validateEmail() -> Bool{
        return self.validate(value: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9,-]+\\.[A-Za-z]{2,6}")
    }
    
    public func validatePhoneNumer() -> Bool{
        return self.validate(value: "^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|147)\\d{8}$")
    }
    
    public func validatePassword() -> Bool {
        return self.validate(value: "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$")
    }
    
    public func validateMoney() -> Bool {
        return self.validate(value: "^[0-9]+(\\.[0-9]{1,2})?$")
    }
}


