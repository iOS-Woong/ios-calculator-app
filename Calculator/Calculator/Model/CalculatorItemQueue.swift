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

    var opreandList: [OperationQueue]

    
    func calculateAllQueue(baseNumber: Double) -> Double {
        let value = opreandList.reduce(baseNumber, {(result: Double, element: OperationQueue) in
            element.operationFlag.calculate(result, element.oprationNumber)
        })
        return value
    }
}

