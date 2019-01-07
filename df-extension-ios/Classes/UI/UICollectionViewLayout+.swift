//
//  UICollectionViewLayout+.swift
//

import UIKit

public extension UICollectionViewLayout {
    
    /**
     수평 Layout
     
     - parameter size: CGSize
     - returns: UICollectionViewLayout
     */
    public static func horizontalLayout(_ size: CGSize) -> UICollectionViewLayout {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flow.itemSize = CGSize(width: size.width, height: size.height)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        return flow
    }
    
    /**
     수직 Layout
     
     - parameter size: CGSize
     - returns: UICollectionViewLayout
     */
    public static func verticalLayout(_ size: CGSize) -> UICollectionViewLayout {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flow.itemSize = CGSize(width: size.width, height: size.height)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        return flow
    }
}
