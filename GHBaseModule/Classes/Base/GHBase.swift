//
//  Base.swift
//  GHBaseModule_Example
//
//  Created by haoguanhao on 08/10/2018.
//  Copyright (c) 2018 haoguanhao. All rights reserved.
//

import UIKit

///----------------------
/// Window And ScreenSize
///----------------------
public let kScreenH = UIScreen.main.bounds.height
public let kScreenW = UIScreen.main.bounds.width
public let keyWindow = UIApplication.shared.keyWindow!

///----------------------
/// 适配iPhoneX
///----------------------
public let is_iPhoneX = (kScreenW == 375.0 && kScreenH == 812.0 ? true:false)
public let kStatusbarH: CGFloat = 20.0
public let kNavibarH: CGFloat = is_iPhoneX ? 68.0 : 44.0
public let kTabbarH: CGFloat = is_iPhoneX ? 49.0 + 34.0 : 49.0
public let iPhoneXBottomH: CGFloat = is_iPhoneX ? 34.0 : 0
public let iPhoneXTopH: CGFloat = is_iPhoneX ? 24.0 : 0

///----------------------
/// 计算Scale
///----------------------
// 以iPhone6s为基准
let GHiPhone6W : CGFloat = 375.0
let GHiPhone6H : CGFloat = 667.0
// 计算比例
// x比例 1.293750 在iPhone7的屏幕上
let ScaleX = kScreenW / GHiPhone6W
// y比例 1.295775
let ScaleY = kScreenH / GHiPhone6H
// 根据屏幕比例转换X坐标
public func gh_transformX(x : CGFloat) -> CGFloat{
    
    return x * ScaleX
}
// 根据屏幕比例转换Y坐标
public func gh_transformY(y : CGFloat) -> CGFloat{
    
    return y * ScaleY
}
public func gh_font(_ size: CGFloat) -> CGFloat {
    if UIDevice.currentSize() == .iPhone5 || UIDevice.currentSize() == .iPhone4 {
        return size - 2
    }
    return size
}

///----------------------
/// Persistence Directory
///----------------------
public let kDOCUMENT_DIRECTORY = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
public let kLIBRARY_DIRECTORY = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
public let kCACHES_DIRECTORY = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last
public let kTEMP_DIRECTORY = NSTemporaryDirectory()

///----------------------
/// NSNotificationCenter
///----------------------
// 通知中心
public let GHNotificationCenter = NotificationCenter.default

///---------
/// App Info
///---------
public let APP_NAME  = Bundle.main.infoDictionary!["CFBundleName"]
public let APP_VERSION  = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
public let APP_BUILD  = Bundle.main.infoDictionary!["CFBundleVersion"]

///----------------------
/// Judge System
///----------------------
public let BKUserAgent: String = {
    if let info = Bundle.main.infoDictionary {
        let executable = info[kCFBundleExecutableKey as String] as? String ?? "Unknown"
        let bundle = info[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
        let appVersion = info["CFBundleShortVersionString"] as? String ?? "Unknown"
        let appBuild = info[kCFBundleVersionKey as String] as? String ?? "Unknown"
        
        let osNameVersion: String = {
            let version = ProcessInfo.processInfo.operatingSystemVersion
            let versionString = "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
            
            let osName: String = {
                #if os(iOS)
                    return "iOS"
                #elseif os(watchOS)
                    return "watchOS"
                #elseif os(tvOS)
                    return "tvOS"
                #elseif os(macOS)
                    return "OS X"
                #elseif os(Linux)
                    return "Linux"
                #else
                    return "Unknown"
                #endif
            }()
            
            return "\(osName) \(versionString)"
        }()
        
        return "\(executable)/\(appVersion) (\(bundle); build:\(appBuild); \(osNameVersion))"
    }
    
    return "bluajack"
}()

///----------------------
/// Color
///----------------------
public let kThemePinkColor = UIColor.hexColor(0xF5769B)
public let kThemeGrayColor = UIColor.hexColor(0xA5A5A5)
public let kThemeBackgroundColor = UIColor.hexColor(0xF4F4F4)

public let kGlobalBackgroundColor = UIColor.init(r: 243, g: 243, b: 243)
public let kLoginBcakgroundColor = UIColor.init(r: 62, g: 161, b: 247)
public let kNavigationBarDarkColor = UIColor.init(r: 7, g: 104, b: 243)
public let kNavigationBarColor = UIColor.init(r: 7, g: 134, b: 231)

