//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let defaultZeroValue = "0"
    var isEnabledTyping: Bool = false
    
    @IBOutlet weak var numberPadZero: UIButton!
    @IBOutlet weak var numberPadZeroZero: UIButton!
    @IBOutlet weak var nowInputValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowInputValue.text = defaultZeroValue
    }
        
    @IBAction func tappedNumberPad(_ sender: UIButton) {
        guard let button = sender.titleLabel?.text else { return }
        guard let checkNowInputValue = nowInputValue else { return }
        
        if isEnabledTyping == true {
            checkNowInputValue.text! += button
        } else {
            checkNowInputValue.text = button
            isEnabledTyping = true
        }
    }
}
