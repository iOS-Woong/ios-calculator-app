//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Woong on 2022/09/19.
//



import Foundation

protocol CalculateItem {
}

struct CalculatorItemQueue: CalculateItem {
    var baseNumber: Double
    var opreandList: [OperationQueue]
    
    func calculateAllQueue() {
        let value = opreandList.reduce(baseNumber, {(result: Double, element: OperationQueue) in
            element.operationFlag.calculate(result, element.oprationNumber)
        })
        print("value: \(value)")
    }    
}

