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
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        guard let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return }
        guard let curve = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue else { return }
        keyboardWillShow(with: keyboardRect, with: duration, with: curve)
    }
    
    public func keyboardWillShow(with keyboardRect: CGRect, with duration: Double, with curve: Int) {
        
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        guard let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return }
        guard let curve = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue else { return }
        keyboardWillHide(with: keyboardRect, with: duration, with: curve)
    }
    
    public func keyboardWillHide(with keyboardRect: CGRect, with duration: Double, with curve: Int) {
        
    }
    
    public func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        removeKeyboardObservers()
    }
    
}
