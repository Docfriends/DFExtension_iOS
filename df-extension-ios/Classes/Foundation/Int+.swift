//
//  Int+.swift
//

import Foundation

public extension Int {
    
    /**
     degrees를 radians로 변경
     
     - returns: Double
     */
    public var degreesToRadians: Double {
        return (Double(self) * Double.pi / 180)
    }
    
    /**
     radians를 degrees로 변경
     
     - returns: Double
     */
    public var radiansToDegrees: Double {
        return (Double(self) * 180 / Double.pi)
    }
    
    /**
     절댓값을 구함
     
     - returns: Double
     */
    public var abs: Int {
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
