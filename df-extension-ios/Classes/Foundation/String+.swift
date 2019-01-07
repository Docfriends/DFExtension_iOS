//
//  String+.swift
//

import Foundation

public extension String {
    
    /**
     EUC-KR로 인코딩
     
     - returns: String
     */
    public var euckrEncoding: String {
        let rawEncoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.EUC_KR.rawValue))
        let encoding = String.Encoding(rawValue: rawEncoding)
        let eucKRStringData = self.data(using: encoding) ?? Data()
        let outputQuery = eucKRStringData.map {byte->String in
            if byte >= UInt8(ascii: "A") && byte <= UInt8(ascii: "Z")
                || byte >= UInt8(ascii: "a") && byte <= UInt8(ascii: "z")
                || byte >= UInt8(ascii: "0") && byte <= UInt8(ascii: "9")
                || byte == UInt8(ascii: "_") || byte == UInt8(ascii: ".")
                || byte == UInt8(ascii: "-") {
                guard let unicode = UnicodeScalar(UInt32(byte)) else {
                    return ""
                }
                return String(Character(unicode))
            } else if byte == UInt8(ascii: " ") {
                return "+"
            } else {
                return String(format: "%%%02X", byte)
            }
            }.joined()
        return outputQuery
    }
    
    /**
     로컬라이징
     
     - returns: String
     */
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    /**
     String range 구하기
     
     - returns: Range<Index>
     */
    public var range: Range<Index> {
        return self.index(self.startIndex, offsetBy: 0)..<self.index(self.startIndex, offsetBy: self.count-1)
    }
    
    /**
     JSON형식으로 되어있는 String을 AnyObject형식으로 변경
     
     - returns: AnyObject
     */
    public var parseJSON: AnyObject {
        guard let data = (self).data(using: String.Encoding.utf8) else { return "" as AnyObject }
        do {
            return try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
        } catch let error as NSError {
            print("parseJSON error \(error)")
        }
        return "" as AnyObject
    }
    
    /**
     base64Decoding로 디코딩해서 Data클래스로 변경
     
     - returns: Data
     */
    public var base64Decoding: Data {
        return Data(base64Encoded: self, options:NSData.Base64DecodingOptions(rawValue: 0)) ?? Data()
    }
    
    /**
     email인지 정규표현식으로 검사
     
     - returns: Bool
     */
    public var isValidEmail: Bool {
        let regEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.) {3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        return NSPredicate(format:"SELF MATCHES %@", regEx).evaluate(with: self)
    }
    
    /**
     url인지 정규표현식으로 검사
     
     - returns: Bool
     */
    public var isValidUrl: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.endIndex.encodedOffset)) {
                return match.range.length == self.endIndex.encodedOffset
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    /**
     한글인지 정규표현식으로 검사
     
     - returns: Bool
     */
    public var isValidKo: Bool {
        let regEx = ".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*"
        return NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: self)
    }
    
    /**
     로컬라이징 + 코멘트
     
     - parameter comment: String
     - returns: String
     */
    public func localizedWithComment(_ comment: String = "") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
    
    /**
     String의 substring 하기
     from ~ to
     
     - parameter from: Int
     - parameter to: Int
     - returns: String
     */
    public func substring(from: Int = 0, to: Int = -1) -> String {
        var toTmp = to
        if toTmp < 0 { toTmp = self.count + toTmp }
        let range = self.index(self.startIndex, offsetBy: from)..<self.index(self.startIndex, offsetBy: toTmp+1)
        return String(self[range])
    }
    
    /**
     String의 substring 하기
     from ~ 길이
     
     - parameter from: Int
     - parameter length: Int
     - returns: String
     */
    public func substring(from:Int = 0, length: Int) -> String {
        let range = self.index(self.startIndex, offsetBy: from)..<self.index(self.startIndex, offsetBy: from+length)
        return String(self[range])
    }
    
    /**
     글자에서 해당 단어의 Range 구하기
     
     - parameter words: String
     - returns: NSRange?
     */
    public func nsRange(_ words: String) -> NSRange? {
        guard let range = self.range(of: words) else { return nil }
        guard let lower = UTF16View.Index(range.lowerBound, within: utf16), let upper = UTF16View.Index(range.upperBound, within: utf16) else { return nil }
        return NSRange(location: lower.encodedOffset, length: upper.encodedOffset - lower.encodedOffset)
    }
}
