//
//  UIScrollView+.swift
//

import UIKit

public extension UIScrollView {
    
    /**
     하단과 남은 offset 계산
     
     - returns: CGFloat
     */
    public var deltaOffsetY: CGFloat {
        let currentOffset = self.contentOffset.y
        let maximumOffset = self.contentSize.height - self.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        return deltaOffset
    }
    
    /**
     우측과 남은 offset 계산
     
     - returns: CGFloat
     */
    public var deltaOffsetX: CGFloat {
        let currentOffset = self.contentOffset.x
        let maximumOffset = self.contentSize.width - self.frame.size.width
        let deltaOffset = maximumOffset - currentOffset
        return deltaOffset
    }
    
    
    /**
     스크롤 상단으로 올리기
     
     - parameter animated: Bool
     */
    public func scrollToTop(_ animated: Bool = true) {
        self.setContentOffset(CGPoint(x: 0, y: -self.contentInset.top), animated: animated)
    }
    
    /**
     스크롤 하단으로 내리기
     
     - parameter animated: Bool
     */
    public func scrollToBottom(_ animated: Bool = true) {
        self.setContentOffset(CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height), animated: animated)
    }
}
