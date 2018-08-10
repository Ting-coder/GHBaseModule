//
//  UIButton+Extension.swift
//  BKBasicTools
//
//  Created by Tinghui Yuan on 2018/1/18.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

//MARK: -定义button相对label的位置
public enum YWButtonEdgeInsetsStyle {
    case Top
    case Left
    case Right
    case Bottom
}

public extension UIButton {
    
    public func layoutButton(style: YWButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        //得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
        
        labelWidth = self.titleLabel?.intrinsicContentSize.width
        labelHeight = self.titleLabel?.intrinsicContentSize.height
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets: UIEdgeInsets = .zero
        var labelEdgeInsets: UIEdgeInsets = .zero
        
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .Top:
            //上 左 下 右
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-imageTitleSpace/2, 0, 0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth!, -imageHeight!-imageTitleSpace/2, 0)
            break;
            
        case .Left:
            imageEdgeInsets = UIEdgeInsetsMake(0, -imageTitleSpace/2, 0, imageTitleSpace)
            labelEdgeInsets = UIEdgeInsetsMake(0, imageTitleSpace/2, 0, -imageTitleSpace/2)
            break;
            
        case .Bottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight!-imageTitleSpace/2, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight!-imageTitleSpace/2, -imageWidth!, 0, 0)
            break;
            
        case .Right:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+imageTitleSpace/2, 0, -labelWidth-imageTitleSpace/2)
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth!-imageTitleSpace/2, 0, imageWidth!+imageTitleSpace/2)
            break;
            
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
}
