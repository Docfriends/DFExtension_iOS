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
        guard let textField = self.value(forKey: "_searchField") as? UITextField else {
            return UITextField()
        }
        return textField
    }
}
