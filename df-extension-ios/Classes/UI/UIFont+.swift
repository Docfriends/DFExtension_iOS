//
//  UIFont+.swift
//

import UIKit

public extension UIFont {
    
    /**
     폰트네임
     - returns: [String]
     */
    static var fontNames: [String] {
        var fontArray = [String]()
        for familyName in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                fontArray.append(fontName)
            }
        }
        return fontArray
    }
}
