//
//  UITableView+.swift
//

import UIKit

public extension UITableView {
    
    /**
     채팅 화면에서 키보드 보일때 테이블뷰의 contentOffset 조절
     
     - parameter view: UIView 테이블뷰의 상위뷰
     - parameter notification: Notification? 디폴트 nil. 키보드 노티피케이션
     - parameter bottomConstraint: NSLayoutConstraint 키보드가 올라가거나 내려갔을때 키보드에 따라 이동할 뷰의 제약
     */
    public func chatKeyboardShow(_ view: UIView, notification: Notification? = nil, bottomConstraint: NSLayoutConstraint) {
        var animationDuration: Double = 0.3
        var animationOptions: AnimationOptions = [.beginFromCurrentState]
        var newBottomConstraint: CGFloat? = nil
        
        if let notification = notification {
            guard let keyboardEndFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            guard let rawAnimation = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber else { return }
            
            newBottomConstraint = UIScreen.main.bounds.size.height - keyboardEndFrame.origin.y
            animationDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
            animationOptions = [.beginFromCurrentState, UIView.AnimationOptions(rawValue: UInt( (rawAnimation.uint32Value << 16) ))]
        }
        
        let oldYContentOffset = self.contentOffset.y
        let oldTableViewHeight = self.bounds.size.height
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: animationOptions, animations: {
            if let newBottomConstraint = newBottomConstraint {
                bottomConstraint.constant = newBottomConstraint
            }
            view.layoutIfNeeded()
            let newTableViewHeight = self.bounds.size.height
            var newYContentOffset = oldYContentOffset - (newTableViewHeight - oldTableViewHeight)
            newYContentOffset = min(newYContentOffset, self.contentSize.height - newTableViewHeight)
            newYContentOffset = max(CGFloat(0), newYContentOffset)
            self.contentOffset = CGPoint(x: self.contentOffset.x, y: newYContentOffset)
        }, completion: nil)
    }
    
    /**
     채팅 화면에서 키보드 사라질때 테이블뷰의 contentOffset 조절
     
     - parameter view: UIView 테이블뷰의 상위뷰
     - parameter notification: Notification? 디폴트 nil. 키보드 노티피케이션
     - parameter bottomConstraint: NSLayoutConstraint 키보드가 올라가거나 내려갔을때 키보드에 따라 이동할 뷰의 제약
     - parameter lastRowIndex: Int 채팅 내용의 어레이 마지막 인덱스
     */
    public func chatKeyboardHideRow(_ view: UIView, notification: Notification? = nil, bottomConstraint: NSLayoutConstraint, lastRowIndex: Int) {
        var animationDuration: Double = 0.3
        var animationOptions: AnimationOptions = [.beginFromCurrentState]
        var newBottomConstraint: CGFloat? = nil
        
        if let notification = notification {
            guard let rawAnimation = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber else { return }
            
            newBottomConstraint = 0
            animationDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
            animationOptions = [.beginFromCurrentState, UIView.AnimationOptions(rawValue: UInt( (rawAnimation.uint32Value << 16) ))]
        }
        
        let oldYContentOffset = self.contentOffset.y
        let oldTableViewHeight = self.bounds.size.height
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: animationOptions, animations: {
            if let newBottomConstraint = newBottomConstraint {
                bottomConstraint.constant = newBottomConstraint
            }
            view.layoutIfNeeded()
            if Int(floor(self.contentSize.height-self.bounds.height)) - 10 > Int(floor(self.contentOffset.y)) {
                self.contentOffset = CGPoint(x: self.contentOffset.x, y: oldYContentOffset)
                let newTableViewHeight = self.bounds.size.height
                var newYContentOffset = oldYContentOffset - (newTableViewHeight - oldTableViewHeight)
                newYContentOffset = min(newYContentOffset, self.contentSize.height - newTableViewHeight)
                newYContentOffset = max(CGFloat(0), newYContentOffset)
                self.contentOffset = CGPoint(x: self.contentOffset.x, y: newYContentOffset)
            } else {
                if lastRowIndex >= 0{
                    self.scrollToRow(at: IndexPath(row: lastRowIndex, section: 0), at: .bottom, animated: false)
                }
            }
        }, completion: nil)
    }
    
    
    /**
     채팅 화면에서 키보드 사라질때 테이블뷰의 contentOffset 조절
     
     - parameter view: UIView 테이블뷰의 상위뷰
     - parameter notification: Notification? 디폴트 nil. 키보드 노티피케이션
     - parameter bottomConstraint: NSLayoutConstraint 키보드가 올라가거나 내려갔을때 키보드에 따라 이동할 뷰의 제약
     - parameter lastSectionIndex: Int 채팅 내용의 어레이 마지막 인덱스
     */
    public func chatKeyboardHideSection(_ view: UIView, notification: Notification? = nil, bottomConstraint: NSLayoutConstraint, lastSectionIndex: Int) {
        var animationDuration: Double = 0.3
        var animationOptions: AnimationOptions = [.beginFromCurrentState]
        var newBottomConstraint: CGFloat? = nil
        
        if let notification = notification {
            guard let rawAnimation = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber else { return }
            
            newBottomConstraint = 0
            animationDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0
            animationOptions = [.beginFromCurrentState, UIView.AnimationOptions(rawValue: UInt( (rawAnimation.uint32Value << 16) ))]
        }
        
        let oldYContentOffset = self.contentOffset.y
        let oldTableViewHeight = self.bounds.size.height
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: animationOptions, animations: {
            if let newBottomConstraint = newBottomConstraint {
                bottomConstraint.constant = newBottomConstraint
            }
            view.layoutIfNeeded()
            if Int(floor(self.contentSize.height-self.bounds.height)) - 10 > Int(floor(self.contentOffset.y)) {
                self.contentOffset = CGPoint(x: self.contentOffset.x, y: oldYContentOffset)
                let newTableViewHeight = self.bounds.size.height
                var newYContentOffset = oldYContentOffset - (newTableViewHeight - oldTableViewHeight)
                newYContentOffset = min(newYContentOffset, self.contentSize.height - newTableViewHeight)
                newYContentOffset = max(CGFloat(0), newYContentOffset)
                self.contentOffset = CGPoint(x: self.contentOffset.x, y: newYContentOffset)
            } else {
                if lastSectionIndex >= 0{
                    self.scrollToRow(at: IndexPath(row: 0, section: lastSectionIndex), at: .bottom, animated: false)
                }
            }
        }, completion: nil)
    }
    
    /**
     채팅 입력창 높이 변경되는 값
     
     - parameter value: CGFloat 이전 높이와 현재높이의 차이값
     - parameter animated: Bool 디폴트 false
     */
    public func chatKeyboardDynamicHeight(_ changeBetweenValue: CGFloat, animated: Bool = false) {
        let offsetY = self.contentOffset.y
        self.setContentOffset(CGPoint(x: self.contentOffset.x, y: offsetY-changeBetweenValue), animated: animated)
    }
    
}
