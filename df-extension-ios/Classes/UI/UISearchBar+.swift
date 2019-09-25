//
//  UISearchBar+.swift
//

import UIKit

public extension UISearchBar {
    
    /**
     textField 가져오기
     
     - returns: UITextField
     */
    var textField: UITextField {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else if let textField = self.value(forKey: "_searchField") as? UITextField {
            return textField
        } else {
            return UITextField()
        }
    }
}
