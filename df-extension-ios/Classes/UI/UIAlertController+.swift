//
//  UIAlertController+.swift
//

import UIKit

public extension UIAlertController {
    
    /**
     텍스트뷰 불러오기
     
     - returns: UITextView?
     */
    public var textView: UITextView? {
        guard let contentViewController = self.value(forKey: "contentViewController") as? UIViewController else { return nil }
        if contentViewController.view == nil { return nil }
        guard let textView = contentViewController.view.subviews.compactMap({ $0 as? UITextView }).first else { return nil }
        return textView
    }
    
    /**
     데이터피커 불러오기
     
     - returns: UIDatePicker?
     */
    public var datePicker: UIDatePicker? {
        guard let contentViewController = self.value(forKey: "contentViewController") as? UIViewController else { return nil }
        if contentViewController.view == nil { return nil }
        guard let datePicker = contentViewController.view.subviews.compactMap({ $0 as? UIDatePicker }).first else { return nil }
        return datePicker
    }
    
    /**
     얼럿컨트롤러 만들기
     
     - parameter title: String?
     - parameter message: String?
     - returns: UIAlertController
     */
    @discardableResult
    public static func alert(_ title: String? = "", message: String?) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    /**
     얼럿컨트롤러 만들기
     
     - parameter title: String?
     - parameter message: String?
     - parameter cancelString: String
     - parameter cancelHandler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public static func alert(_ title: String? = "", message: String?, cancelString: String, cancelHandler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return UIAlertController
            .alert(title, message: message)
            .cancel(cancelString, handler: cancelHandler)
    }
    
    /**
     얼럿컨트롤러 만들기
     
     - parameter title: String?
     - parameter message: String?
     - parameter defaultString: String
     - parameter defaultHandler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public static func alert(_ title: String? = "", message: String?, defaultString: String, defaultHandler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return UIAlertController
            .alert(title, message: message)
            .add(defaultString, handler: defaultHandler)
    }
    
    /**
     얼럿컨트롤러 만들기
     
     - parameter title: String?
     - parameter message: String?
     - parameter defaultString: String
     - parameter cancelString: String
     - parameter defaultHandler: ((UIAlertController) -> Void)? = nil)
     - parameter cancelHandler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public static func alert(_ title: String? = "", message: String?, defaultString: String, cancelString: String, defaultHandler: @escaping ((UIAlertController) -> Void), cancelHandler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return UIAlertController
            .alert(title, message: message)
            .cancel(cancelString, handler: cancelHandler)
            .add(defaultString, handler: defaultHandler)
    }
    
    /**
     얼럿컨트롤러 만들기
     
     - parameter title: String?
     - parameter message: String?
     - returns: UIAlertController
     */
    @discardableResult
    public static func sheet(_ title: String? = "", message: String?) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    }
    
    /**
     얼럿컨트롤러 만들기
     
     - parameter title: String?
     - parameter message: String?
     - parameter cancelString: String
     - parameter cancelHandler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public static func sheet(_ title: String? = "", message: String?, cancelString: String, cancelHandler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return UIAlertController
            .sheet(title, message: message)
            .cancel(cancelString, handler: cancelHandler)
    }
    
    /**
     얼럿컨트롤러 만들기
     
     - parameter title: String?
     - parameter message: String?
     - parameter defaultString: String
     - parameter defaultHandler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public static func sheet(_ title: String? = "", message: String?, defaultString: String, defaultHandler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return UIAlertController
            .sheet(title, message: message)
            .add(defaultString, handler: defaultHandler)
    }
    
    /**
     얼럿컨트롤러 만들기
     
     - parameter title: String?
     - parameter message: String?
     - parameter defaultString: String
     - parameter cancelString: String
     - parameter defaultHandler: ((UIAlertController) -> Void)? = nil)
     - parameter cancelHandler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public static func sheet(_ title: String? = "", message: String?, defaultString: String, cancelString: String, defaultHandler: @escaping ((UIAlertController) -> Void), cancelHandler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return UIAlertController
            .sheet(title, message: message)
            .cancel(cancelString, handler: cancelHandler)
            .add(defaultString, handler: defaultHandler)
    }
    
    /**
     액션 추가
     - parameter title: String?
     - parameter style: UIAlertActionStyle
     - parameter handler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    private func action(_ title: String?, style: UIAlertAction.Style, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        self.addAction(UIAlertAction(title: title, style: style, handler: { [weak self] (_) in
            handler?(self ?? UIAlertController())
        }))
        return self
    }
    
    /**
     디폴트 액션 추가
     
     - parameter title: String?
     - parameter handler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public func add(_ title: String?, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return self.action(title, style: .default, handler: handler)
    }
    
    /**
     취소 액션 추가
     
     - parameter title: String?
     - parameter handler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public func cancel(_ title: String?, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return self.action(title, style: .cancel, handler: handler)
    }
    
    /**
     Destructive 액션 추가
     
     - parameter title: String?
     - parameter handler: ((UIAlertController) -> Void)? = nil)
     - returns: UIAlertController
     */
    @discardableResult
    public func destructive(_ title: String?, handler: ((UIAlertController) -> Void)? = nil) -> UIAlertController {
        return self.action(title, style: .destructive, handler: handler)
    }
    
    /**
     텍스트필드 추가
     
     - parameter handler: ((UITextField) -> Void)?
     - returns: UIAlertController
     */
    @discardableResult
    public func appendTextField(_ handler: ((UITextField) -> Void)? = nil) -> UIAlertController {
        self.addTextField { (textField) in
            handler?(textField)
        }
        return self
    }
    
    /**
     텍스트뷰 추가
     
     - parameter textView: UITextView?
     - parameter handler: ((UITextView) -> Void)?
     - returns: UIAlertController
     */
    @discardableResult
    public func appendTextView(_ textView: UITextView? = nil, handler: ((UITextView) -> Void)? = nil) -> UIAlertController {
        let textViewController = UIViewController()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        var textView = textView
        if textView == nil {
            textView = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
        textView?.translatesAutoresizingMaskIntoConstraints = false
        textView?.layer.borderColor = UIColor(white: 210/255, alpha: 1).cgColor
        textView?.layer.borderWidth = 1
        if let textView = textView {
            handler?(textView)
            view.addSubview(textView)
            
            let view_constraint_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-6-[view]-6-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["view": textView])
            let view_constraint_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-6-[view]-6-|", options: NSLayoutConstraint.FormatOptions.alignAllLeading, metrics: nil, views: ["view": textView])
            view.addConstraints(view_constraint_H)
            view.addConstraints(view_constraint_V)
        }
        textViewController.view = view
        textViewController.preferredContentSize.height = 100
        self.setValue(textViewController, forKey: "contentViewController")
        
        return self
    }
    
    /**
     데이터피커 추가
     
     - parameter handler: ((UIDatePicker) -> Void)?
     - returns: UIAlertController
     */
    @discardableResult
    public func appendDatePicker(_ handler: ((UIDatePicker) -> Void)? = nil) -> UIAlertController {
        let viewController = UIViewController()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        if let locale = (UserDefaults.standard.object(forKey: "AppleLanguages") as? [String])?.first {
            datePicker.locale = NSLocale(localeIdentifier: locale) as Locale
        }
        datePicker.datePickerMode = .date
        
        handler?(datePicker)
        view.addSubview(datePicker)
        
        let view_constraint_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-6-[view]-6-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["view": datePicker])
        let view_constraint_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-6-[view]-6-|", options: NSLayoutConstraint.FormatOptions.alignAllLeading, metrics: nil, views: ["view": datePicker])
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)
        viewController.view = view
        viewController.preferredContentSize.height = 300
        self.setValue(viewController, forKey: "contentViewController")
        
        return self
    }
    
    /**
     얼럿 컨트롤러 present
     
     - parameter viewController: UIViewController
     - returns: UIAlertController
     */
    @discardableResult
    public func show(_ viewController: UIViewController?) -> UIAlertController {
        DispatchQueue.main.async {
            viewController?.present(self, animated: true, completion: nil)
        }
        return self
    }
    
    /**
     퍼미션 설정 화면으로 이동
     
     - parameter title: String
     - parameter handler: (() -> Void)? = nil
     - returns: UIAlertController
     */
    @discardableResult
    public func openSetting(_ title: String, handler: (() -> Void)? = nil) -> UIAlertController {
        self.addAction(UIAlertAction(title: title, style: .default, handler: { (_) in
            handler?()
            guard let bundleIdentifier = Bundle.main.bundleIdentifier else { return }
            guard let url = URL(string: "\(UIApplication.openSettingsURLString)\(bundleIdentifier)") else { return }
            if !UIApplication.shared.canOpenURL(url) { return }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }))
        return self
    }
}
