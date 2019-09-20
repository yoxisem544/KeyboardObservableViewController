//
//  UIKeyboardObservableViewController.swift
//  KeyboardObservableVC
//
//  Created by David on 2016/11/23.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

public class UIKeyboardObservableViewController : UIViewController {

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        registerKeyboardNotification()
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObservers()
    }

    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard
            let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            else { return }

        keyboardWillShow(withKeyboard: keyboardRect, animationCurve: UIView.AnimationOptions(rawValue: curve.uintValue), duration: duration.doubleValue)
    }

    public func keyboardWillShow(withKeyboard rect: CGRect, animationCurve: UIView.AnimationOptions, duration: Double) {

    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard
            let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            else { return }

        keyboardWillHide(withKeyboard: keyboardRect, animationCurve: UIView.AnimationOptions(rawValue: curve.uintValue), duration: duration.doubleValue)
    }

    public func keyboardWillHide(withKeyboard rect: CGRect, animationCurve: UIView.AnimationOptions, duration: Double) {

    }

    public func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self)
    }

    deinit {
        removeKeyboardObservers()
    }

}
