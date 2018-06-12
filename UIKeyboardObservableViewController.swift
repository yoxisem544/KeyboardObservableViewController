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
    guard
      let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
      let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber,
      let curve = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
      else { return }

    keyboardWillShow(with: keyboardRect, duration: duration, curve: curve)
  }

  public func keyboardWillShow(with keyboardRect: CGRect, duration: NSNumber, curve: NSNumber) {

  }

  @objc private func keyboardWillHide(_ notification: Notification) {
    guard
      let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber,
      let curve = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
      else { return }

    keyboardWillHide(duration: duration, curve: curve)
  }

  public func keyboardWillHide(duration: NSNumber, curve: NSNumber) {

  }

  public func removeKeyboardObservers() {
    NotificationCenter.default.removeObserver(self)
  }

  deinit {
    removeKeyboardObservers()
  }

}
