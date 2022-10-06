//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var isEnabledTyping: Bool = false
    var allComponentsForCalculation: String = ""
    let numberFormatter: NumberFormatter = NumberFormatter()
    
    @IBOutlet weak var nowInputOperator: UILabel!
    @IBOutlet weak var nowInputNumber: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowInputNumber.text = "0"
    }
        
    @IBAction func tappedNumberPad(_ sender: UIButton) {
        guard let opdButton = sender.titleLabel?.text else { return }
        guard let checkNowInputValue = nowInputNumber else { return }
        
        if isEnabledTyping == true {
            checkNowInputValue.text! += opdButton
        } else {
            if opdButton == "0" || opdButton == "00" {
            } else {
                checkNowInputValue.text = opdButton
                isEnabledTyping = true
            }
        }
    }

    @IBAction func tappedOperatorPad(_ sender: UIButton) {
        guard let optButton = sender.titleLabel?.text else { return }
        guard let checkNowInputNumber = nowInputNumber.text else { return }
        
        if nowInputNumber.text != "0" {
            makeLabel()
            nowInputOperator.text = optButton
            allComponentsForCalculation += (checkNowInputNumber + optButton)
        }
        resetNowInputNumber()
        setScrollToBottom()
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard let checkNowInputNumber = nowInputNumber.text else { return }
        
        makeLabel()
        allComponentsForCalculation += (checkNowInputNumber)
        
        print(allComponentsForCalculation)
        var calcResult = ExpressionParser.parse(from: allComponentsForCalculation)
        let doCalculate = calcResult.result()
        
        nowInputNumber.text = resultDoubleToString(result: doCalculate)
    }
    
    private func resultDoubleToString(result: Double) -> String {
        guard let formattedString = numberFormatter.string(for: result) else { return "" }
        return formattedString
    }
    
    
    
    private func makeLabel() {
        let opdLabel = UILabel()
        opdLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        opdLabel.textColor = .white
        opdLabel.isHidden = true
        opdLabel.text = nowInputNumber.text
        
        let optLabel = UILabel()
        optLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        optLabel.textColor = .white
        optLabel.isHidden = true
        optLabel.text = nowInputOperator.text
        
        let stack = UIStackView()
        stack.spacing = 8
        
        if allComponentsForCalculation == "" {
            stack.addArrangedSubview(opdLabel)
        } else {
            stack.addArrangedSubview(optLabel)
            stack.addArrangedSubview(opdLabel)
        }
        
        stackView.addArrangedSubview(stack)
        
        UIView.animate(withDuration: 0.3) {
            optLabel.isHidden = false
            opdLabel.isHidden = false
        }
    }
    
    private func setScrollToBottom() {
        scrollView.setContentOffset(CGPoint(x: .zero, y: scrollView.contentSize.height - scrollView.bounds.height), animated: true)
    }
    
    private func resetNowInputNumber() {
        nowInputNumber.text = "0"
        isEnabledTyping = false
    }
    
    
    
}
