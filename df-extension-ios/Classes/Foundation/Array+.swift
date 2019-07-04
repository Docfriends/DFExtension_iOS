//
//  Array+.swift
//

import Foundation

public extension Array {
    
    /**
     Array 를 JSON string으로 변경
     
     ```swift
     [1, 2, 3, 4].JSONStringify()
     [1, 2, 3, 4].JSONStringify(true)
     [1, 2, 3, 4].JSONStringify(false)
     ```
     
     - parameter prettyPrinted: Bool값 디폴트는 false. prettyPrinted가 true로 하면 공백과 들여쓰기를 사용하여 출력을 보다 쉽게 읽을수 있는 옵션. [Apple 문서 참고](https://developer.apple.com/documentation/foundation/jsonserialization/writingoptions/1418364-prettyprinted)
     - returns: JSON 형태의 String값
     */
    func JSONStringify(_ prettyPrinted: Bool = false) -> String {
        let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0)
        if JSONSerialization.isValidJSONObject(self) {
            do {
                let data = try JSONSerialization.data(withJSONObject: self, options: options)
                if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                    return string as String
                }
            } catch let error as NSError {
                print("JSON stringify error \(error)")
            }
        }
        return ""
    }
}
