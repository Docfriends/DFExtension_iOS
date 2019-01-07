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
    public var classNameToString: String {
        return NSStringFromClass(type(of: self))
    }
    
    /**
     className을 string 으로 변경
     
     ```swift
     NSObject.classNameToString
     ```
     
     - returns: String
     */
    public static var classNameToString: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
