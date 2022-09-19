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
        let a = CalculatorItemQueue(baseNumber: 10, opreandList: [OperationQueue(oprationNumber: 10, operationFlag: .plus),
                                                                  OperationQueue(oprationNumber: 5, operationFlag: .multifly),
                                                                  OperationQueue(oprationNumber: 2, operationFlag: .minus)])
        a.calculateAllQueue()
    }


}

