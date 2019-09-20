//
//  ViewController.swift
//  KeyboardObservableVC
//
//  Created by David on 2016/11/23.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

class ViewController: UIKeyboardObservableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func keyboardWillShow(withKeyboard rect: CGRect, animationCurve: UIView.AnimationOptions, duration: Double) {
        
    }

    override func keyboardWillHide(withKeyboard rect: CGRect, animationCurve: UIView.AnimationOptions, duration: Double) {

    }

}

