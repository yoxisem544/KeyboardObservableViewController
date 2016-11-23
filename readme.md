#UIKeyboardObervableViewController
a view controller help you to observe keyboard show and hide.

## How to use it
First, import `UIKeyboardObservableViewController` to your project

Then goto place you want to observe keyboard, and change subclass `UIViewController` to `UIKeyboardObservableViewController`.

Then remember to call super.viewDidLoad() in viewDidLoad().

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
}
```

Then override these 2 methods.

```swift
override func keyboardWillShow(with keyboardRect: CGRect) {
    // adjust inset
}
    
override func keyboardWillHide() {
    // adjust inset
}
```

then you are good to go!

you don't need to worry about adding observer or deiniting stuff. All things requried were done for you.