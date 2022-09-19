//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let a = CalculatorItemQueue(opreandList: [OperationQueue(oprationNumber: 10, operationFlag: .plus),
                                                  OperationQueue(oprationNumber: 20, operationFlag: .divide),
                                                  OperationQueue(oprationNumber: 30, operationFlag: .plus)])
        a.calculateAllQueue(baseNumber: 10)
    }


}

