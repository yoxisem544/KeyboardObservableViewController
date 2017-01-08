//
//  UIKeyboardObservableViewController.swift
//  KeyboardObservableVC
//
//  Created by David on 2016/11/23.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

public class UIKeyboardObservableViewController : UIViewController {
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        registerKeyboardNotification()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        guard let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return }
        guard let curve = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue else { return }
        keyboardWillShow(with: keyboardRect, duration: duration, animationCurve: curve)
    }
    
    public func keyboardWillShow(with keyboardRect: CGRect, duration: TimeInterval, animationCurve: Int) {
        
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        guard let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return }
        guard let curve = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue else { return }
        keyboardWillHide(with: keyboardRect, duration: duration, animationCurve: curve)
    }
    
    public func keyboardWillHide(with keyboardRect: CGRect, duration: TimeInterval, animationCurve: Int) {
        
    }
    
    public func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        removeKeyboardObservers()
    }
    
}
