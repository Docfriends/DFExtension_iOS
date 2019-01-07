//
//  CGFloat+.swift
//

import UIKit

public extension CGFloat {
    
    /**
     degrees를 radians로 변경
     
     - returns: Float
     */
    public var degreesToRadians: CGFloat {
        return (self * CGFloat.pi / 180)
    }
    
    /**
     radians를 degrees로 변경
     
     - returns: Float
     */
    public var radiansToDegrees: CGFloat {
        return (self * 180 / CGFloat.pi)
    }
    
    /**
     절댓값을 구함
     
     - returns: Float
     */
    public var abs: CGFloat {
        return self > 0 ? self : -self
    }
    
    /**
     1000 단위로 , 를 붙임
     
     - returns: String
     */
    public var priceComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value: Float(self))) ?? "0"
    }
}
