//
//  Float+.swift
//  

import Foundation

public extension Float {
    
    /**
     degrees를 radians로 변경
     
     - returns: Float
     */
    public var degreesToRadians: Float {
        return (self * Float.pi / 180)
    }
    
    /**
     radians를 degrees로 변경
     
     - returns: Float
     */
    public var radiansToDegrees: Float {
        return (self * 180 / Float.pi)
    }
    
    /**
     절댓값을 구함
     
     - returns: Float
     */
    public var abs: Float {
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
