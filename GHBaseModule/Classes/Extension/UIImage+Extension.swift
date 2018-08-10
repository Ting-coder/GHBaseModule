//
//  UIImage+Extension.swift
//  GHBaseModule_Example
//
//  Created by haoguanhao on 08/10/2018.
//  Copyright (c) 2018 haoguanhao. All rights reserved.
//

import UIKit

// MARK: - 渲染图片的模式
extension UIImage {
    
    static func renderImageOriginal(imageName : String) -> UIImage{
        
        return UIImage.init(named: imageName)!.withRenderingMode(.alwaysOriginal)
        
    }
}

// MARK: - UIIMage扩展
extension UIImage {
    /// 根据颜色创建图片
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    /// 默认压缩一半,范围 0-1
    func scale(_ value : CGFloat = 0.3) -> UIImage? {
        if value > 1 { return self }
        if value <= 0 { return nil }
        
        let scaleSize = CGSize(width: self.size.width * value,
                               height: self.size.height * value)
        let newImage : UIImage?
        /// 重新绘制图片
        UIGraphicsBeginImageContext(scaleSize)
        
        self.draw(in: CGRect.init(x: 0, y: 0, width: scaleSize.width, height: scaleSize.height))
        newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
