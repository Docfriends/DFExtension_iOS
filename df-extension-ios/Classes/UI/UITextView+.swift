//
//  UITextView+.swift
//

import UIKit

public extension UITextView {
    
    /**
     텍스트뷰 사이즈 콘텐츠에 맞게 변경
     
     - returns: CGRect
     */
    var changeContentSize: CGRect {
        let fixedWidth = self.frame.size.width
        self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = self.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        return newFrame
    }
    
    /**
     maxLength 계산
     
     - parameter maxLength: Int 최대 길이 디폴트 2000
     - parameter range: NSRange
     - parameter string: String
     - returns: Bool
     */
    func maxLength(_ maxLength: Int = 2000, range: NSRange, text: String) -> Bool {
        return maxLength == -1 ? true : (self.text.utf16.count + text.utf16.count - range.length) <= maxLength
    }
}
