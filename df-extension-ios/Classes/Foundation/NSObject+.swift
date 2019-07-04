//
//  NSObject+.swift
//

import Foundation

public extension NSObject {
    
    /**
     className을 string 으로 변경
     
     ```swift
     NSObject().classNameToString
     ```
     
     - returns: String
     */
    var classNameToString: String {
        return NSStringFromClass(type(of: self))
    }
    
    /**
     className을 string 으로 변경
     
     ```swift
     NSObject.classNameToString
     ```
     
     - returns: String
     */
    static var classNameToString: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
