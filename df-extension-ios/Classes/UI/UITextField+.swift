//
//  UITextField+.swift
//

import UIKit

public extension UITextField {
    
    /**
     maxLength 계산
     
     - parameter maxLength: Int 최대 길이 디폴트 200
     - parameter range: NSRange
     - parameter string: String
     - returns: Bool
     */
    public func maxLength(_ maxLength: Int = 200, range: NSRange, string: String) -> Bool {
        return maxLength == -1 ? true : ((self.text?.utf16.count ?? 0) + string.utf16.count - range.length) <= maxLength
    }
    
    /**
     툴바 만들기
     
     - parameter target: Any?
     - parameter action: Selector
     - parameter color: UIColor
     - parameter selectString: String
     - parameter cancelString: String
     */
    public func toolBar(_ target: Any?, action: Selector, color: UIColor = UIColor(white: 224/255, alpha: 1), selectString: String = "Done", cancelString: String = "Cancel") {
        let toolBar =  UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = color
        
        toolBar.setItems([
            UIBarButtonItem(title: cancelString, style: .plain, target: self, action: #selector(self.cancelAction(_:))),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: selectString, style: .done, target: target, action: action)
            ], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        self.inputAccessoryView = toolBar
    }
    
    @objc private func cancelAction(_ sender: UIBarButtonItem) {
        self.resignFirstResponder()
    }
}
