//
//  NSMutableAttributedString+.swift
//

import UIKit

public extension NSMutableAttributedString {
    
    /**
     NSMutableAttributedString에 attachment 아이콘 추가
     
     ```swift
     let attributedString = NSMutableAttributedString()
     attributedString.attachment("image", color: .black, rect: CGRect(x: 0, y: -6, width: 12, height: 12))
     ```
     
     - parameter name: String 이미지 명
     - parameter color: UIColor? 이미지 색. nil이나 생략하면 이미지 원래 색
     - parameter rect: CGRect 이미지 사이즈
     */
    func attachment(_ name: String, color: UIColor? = nil, rect: CGRect) {
        let attachment = NSTextAttachment()
        if let color = color {
            guard let image = UIImage(named: name) else { return }
            let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
            if let context = UIGraphicsGetCurrentContext() {
                context.setBlendMode(CGBlendMode.normal)
                context.translateBy(x: 0, y: image.size.height)
                context.scaleBy(x: 1.0, y: -1.0)
                if let cgImage = image.cgImage {
                    context.draw(cgImage, in: rect)
                    context.clip(to: rect, mask: cgImage)
                }
                context.setFillColor(color.cgColor)
                context.fill(rect)
            }
            let colorizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            attachment.image = colorizedImage?.withRenderingMode(.alwaysOriginal)
        } else {
            attachment.image = UIImage(named: name)
        }
        attachment.bounds = rect
        let attachmentString = NSAttributedString(attachment: attachment)
        self.append(attachmentString)
    }
}

public extension NSAttributedString {
    
    /**
     URL링크 Attributed 변경 가져오기
     
     - parameter color: UIColor
     - parameter handler: @escaping (([NSAttributedString.Key : Any], NSRange) -> Void)
     */
    func urlLink(_ color: UIColor, handler: @escaping (([NSAttributedString.Key : Any], NSRange) -> Void)) {
        let text = self.string
        text.urlLink { (url) in
            if let range = text.range(of: url) {
                text.enumerateSubstrings(in: range, options: String.EnumerationOptions.bySentences) {
                    (substring, substringRange, _, _) in
                    
                    let attributed = [NSAttributedString.Key.link: url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "",
                                      NSAttributedString.Key.underlineColor: color,
                                      NSAttributedString.Key.foregroundColor: color,
                                      NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single] as [NSAttributedString.Key : Any]
                    handler(attributed, NSRange(substringRange, in: text))
                }
            }
        }
    }
}
