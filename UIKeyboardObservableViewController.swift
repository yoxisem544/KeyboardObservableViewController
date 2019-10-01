//
//  UIKeyboardObservableViewController.swift
//  KeyboardObservableVC
//
//  Created by David on 2016/11/23.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

/// A view controller which is able to observe keyboard show/hide event.
///
/// Inherit `UIKeyboardObservableViewController` if you need to get notified when keyboard frame has changed.
/// `UIKeyboardObservableViewController` will start observing keyboard frame change on viewWillAppear(_:),
/// and stop observing when viewWillDisappear(_:).
///
/// Observing keyboard change manually with `UIKeyboardObservableViewController` is not recommended.
/// Doing this may cause weird bevavior.
public class UIKeyboardObservableViewController : UIViewController {

    // MARK: - View Controller Life Cycle
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        registerKeyboardNotification() // register keyboard notification when view is about to appear
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObservers() // stop observing keyboard when view is about to disappear
    }

    deinit {
        removeKeyboardObservers()
    }

    // MARK: - Notification
    public func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self)
    }

    private func registerKeyboardNotification() {
        removeKeyboardObservers() // this should prevent from observing keyboard change twice.

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Keyboard
    // MARK: will show
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

    // MARK: will hide
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

}
