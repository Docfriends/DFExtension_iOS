//
//  UIImage+.swift
//

import UIKit

public extension UIImage {
    
    /**
     사이즈 변경
     - parameter size: CGSize
     - parameter scale: CGFloat 디폴트 1
     - parameter hasAlpha: Bool 디폴트 false
     - returns: UIImage?
     */
    func resize(_ size: CGSize, scale: CGFloat = 1, hasAlpha: Bool = false) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
    /**
     퀄리티 변경
     - parameter percentage: CGFloat
     - returns: UIImage?
     */
    func rePercentage(_ percentage: CGFloat) -> UIImage {
        guard let data = self.jpegData(compressionQuality: percentage) else { return UIImage() }
        return UIImage(data: data) ?? UIImage()
    }
    
    /**
     리사이즈와 퀄리티 변경
     - parameter size: CGFloat 디폴트 1000
     - parameter percent: CGFloat 디폴트 0.15
     - parameter handler: ((UIImage) -> Void)
     */
    func resized(size: CGFloat = 1000, percent: CGFloat = 0.15, handler: @escaping ((UIImage) -> Void)) {
        var width: CGFloat = 0
        var height: CGFloat = 0
        if self.size.width > self.size.height {
            width = size
            height = width*self.size.height/self.size.width
        } else {
            height = size
            width = height*self.size.width/self.size.height
        }
        DispatchQueue.global().async {
            if let image = self.resize(CGSize(width: width, height: height))?.rePercentage(percent) {
                DispatchQueue.main.async { handler(image) }
            }
        }
    }
    
    /**
     색 변경
     - parameter color: UIColor
     - returns: UIImage?
     */
    func rendering(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        if let context = UIGraphicsGetCurrentContext() {
            context.setBlendMode(CGBlendMode.normal)
            context.translateBy(x: 0, y: self.size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            if let cgImage = self.cgImage {
                context.draw(cgImage, in: rect)
                context.clip(to: rect, mask: cgImage)
            }
            context.setFillColor(color.cgColor)
            context.fill(rect)
        }
        let colorizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colorizedImage?.withRenderingMode(.alwaysOriginal)
    }
}
