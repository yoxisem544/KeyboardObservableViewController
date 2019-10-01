#UIKeyboardObervableViewController
a view controller help you to observe keyboard show and hide.

#Requirement
- swift 5
- xcode 11.0

## How to use it
First, import `UIKeyboardObservableViewController` to your project

Then goto place you want to observe keyboard, and change subclass `UIViewController` to `UIKeyboardObservableViewController`.

Notification wll be setup when `viewDidAppear`, and will be removed when `viewDidDisappear`.

You don't need to do anything but remember to call `super.viewDidAppear` and `super.viewDidDisappear`.

Also, no need to care about removing observer when deinit is called. I handled it for you :)

Then override these 2 methods.

```swift
class YourViewController: UIKeyboardObservableViewController {

  /** your code... */

  public func keyboardWillShow(withKeyboard rect: CGRect, animationCurve: UIViewAnimationOptions, duration: Double) {

  }

  public func keyboardWillHide(withKeyboard animationCurve: UIViewAnimationOptions, duration: Double) {

  }
}
```

then you are good to go!

you don't need to worry about adding observer or deiniting stuff. All things requried were done for you.
