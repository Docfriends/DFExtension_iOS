//
//  Date+.swift
//

import Foundation

public typealias DateTuple = (year: String, month: String, day: String, hour: String, minute: String, second: String)
public typealias DateTupleInt = (year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?)

public extension Date {
    
    public init(milliseconds: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
    /**
     1970부터의 milliseconds를 String으로 구함
     
     - returns: String
     */
    
    public var millisecondsSince1970: String {
        let date = (self.timeIntervalSince1970 * 1000.0).rounded()
        let value = "\(date)"
        guard let milliseconds = value.split(separator: ".").first else {
            return "\(value)"
        }
        return "\(milliseconds)"
    }
    
    /**
     데이터 튜플 구하기
     
     - returns: DateTuple
     */
    public var dateTuple: DateTuple {
        let calendar = Calendar.current
        
        let year = (calendar as NSCalendar).components(.year, from: self).year ?? 1990
        let month = (calendar as NSCalendar).components(.month, from: self).month ?? 6
        let day = (calendar as NSCalendar).components(.day, from: self).day ?? 1
        let hour = (calendar as NSCalendar).components(.hour, from: self).hour ?? 12
        let minute = (calendar as NSCalendar).components(.minute, from: self).minute ?? 0
        let second = (calendar as NSCalendar).components(.second, from: self).second ?? 0
        
        let yearString = "\(year)"
        let monthString = month < 10 ? "0\(month)" : "\(month)"
        let dayString = day < 10 ? "0\(day)" : "\(day)"
        let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
        let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
        let secondString = second < 10 ? "0\(second)" : "\(second)"
        
        return DateTuple(yearString, monthString, dayString, hourString, minuteString, secondString)
    }
    
    /**
     데이터 튜플 구하기
     
     - returns: DateTuple
     */
    public var dateTupleInt: DateTupleInt {
        let calendar = Calendar.current
        
        let year = (calendar as NSCalendar).components(.year, from: self).year
        let month = (calendar as NSCalendar).components(.month, from: self).month
        let day = (calendar as NSCalendar).components(.day, from: self).day
        let hour = (calendar as NSCalendar).components(.hour, from: self).hour
        let minute = (calendar as NSCalendar).components(.minute, from: self).minute
        let second = (calendar as NSCalendar).components(.second, from: self).second
        
        return DateTupleInt(year, month, day, hour, minute, second)
    }
    
    /**
     YYYY MM DD 형식으로 년월일 구하기
     
     - parameter of: String
     - returns: String
     */
    public func getDate(_ of: String = "-") -> String {
        let tuple = self.dateTuple
        return "\(tuple.year)\(of)\(tuple.month)\(of)\(tuple.day)"
    }
    
    /**
     HH mm ss 형식으로 시분초 구하기
     
     - parameter of: String
     - returns: String
     */
    public func getTime(_ of: String = ":") -> String {
        let tuple = self.dateTuple
        return "\(tuple.hour)\(of)\(tuple.minute)\(of)\(tuple.second)"
    }
    
    /**
     데이터 두개 사이의 날짜 구하기
     
     - parameter toDate: Date
     - returns: Int
     */
    public func betweenDays(_ toDate: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: toDate).day ?? 0
    }
    
    /**
     두개의 날짜 년도 비교
     
     - parameter toDate: Date
     - returns: Bool
     */
    public func equalYear(_ toDate: Date) -> Bool {
        let currentTuple = self.dateTuple
        let dateTuple = toDate.dateTuple
        return currentTuple.year == dateTuple.year
    }
    
    /**
     두개의 날짜 년, 월 비교
     
     - parameter toDate: Date
     - returns: Bool
     */
    public func equalMonth(_ toDate: Date) -> Bool {
        let currentTuple = self.dateTuple
        let dateTuple = toDate.dateTuple
        return currentTuple.year == dateTuple.year && currentTuple.month == dateTuple.month
    }
    
    /**
     두개의 날짜 년, 월, 일 비교
     
     - parameter toDate: Date
     - returns: Bool
     */
    public func equalDay(_ toDate: Date) -> Bool {
        let currentTuple = self.dateTuple
        let dateTuple = toDate.dateTuple
        return currentTuple.year == dateTuple.year && currentTuple.month == dateTuple.month && currentTuple.day == dateTuple.day
    }
    
    /**
     날짜 포맷으로 Date 만들기
     
     - parameter date: String
     - parameter format: String
     - parameter timeZone: TimeZone = TimeZone.current
     - parameter locale: Locale = Locale.current
     - returns: Date?
     */
    public static func format(_ date: String, format: String, timeZone: TimeZone = TimeZone.current, locale: NSLocale = NSLocale(localeIdentifier: Locale.current.identifier)) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale as Locale
        return dateFormatter.date(from: date)
    }
}
