//
//  Double+.swift
//

import Foundation

public extension Double {
    
    /**
     degrees를 radians로 변경
     
     - returns: Double
     */
    public var degreesToRadians: Double {
        return (self * Double.pi / 180)
    }
    
    /**
     radians를 degrees로 변경
     
     - returns: Double
     */
    public var radiansToDegrees: Double {
        return (self * 180 / Double.pi)
    }
    
    /**
     절댓값을 구함
     
     - returns: Double
     */
    public var abs: Double {
        return self > 0 ? self : -self
    }
    
    /**
     1000 단위로 , 를 붙임
     
     - returns: String
     */
    public var priceComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
