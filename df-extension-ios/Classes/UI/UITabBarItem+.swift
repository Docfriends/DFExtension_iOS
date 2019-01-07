//
//  UITabBarItem+.swift
//

import UIKit

public extension UITabBarItem {
    
    /**
     탭바 아이템 기본 설정
     
     - parameter title: String
     - parameter imageName: String
     - parameter color: UIColor? 디폴트 nil
     - parameter selectedColor: UIColor? 디폴트 nil
     - returns: UITabBarItem
     */
    @discardableResult
    public func setEntity(_ title: String, imageName: String, color: UIColor? = nil, selectedColor: UIColor? = nil) -> UITabBarItem {
        self.imageInsets = UIEdgeInsets.zero
        self.title = title
        if let color = color {
            self.image = UIImage(named: imageName)?.rendering(color)
        } else {
            self.image = UIImage(named: imageName)
        }
        if let selectedColor = selectedColor {
            self.selectedImage = UIImage(named: imageName)?.rendering(selectedColor)
        } else {
            self.selectedImage = UIImage(named: imageName)
        }
        return self
    }
    
    /**
     탭바 아이템 기본 설정
     
     - parameter title: String
     - parameter image: UIImage?
     - parameter color: UIColor? 디폴트 nil
     - parameter selectedColor: UIColor? 디폴트 nil
     - returns: UITabBarItem
     */
    @discardableResult
    public func setEntity(_ title: String, image: UIImage?, color: UIColor? = nil, selectedColor: UIColor? = nil) -> UITabBarItem {
        self.imageInsets = UIEdgeInsets.zero
        self.title = title
        if let color = color {
            self.image = image?.rendering(color)
        } else {
            self.image = image
        }
        if let selectedColor = selectedColor {
            self.selectedImage = image?.rendering(selectedColor)
        } else {
            self.selectedImage = image
        }
        return self
    }
    
    /**
     탭바 아이템 기본 설정
     
     - parameter title: String
     - parameter image: UIImage?
     - parameter selectedImage: UIImage?
     - returns: UITabBarItem
     */
    @discardableResult
    public func setEntity(_ title: String, image: UIImage?, selectedImage: UIImage?) -> UITabBarItem {
        self.imageInsets = UIEdgeInsets.zero
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
        return self
    }
}
