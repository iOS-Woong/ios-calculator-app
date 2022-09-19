//
//  OperationList.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/19.
//

import Foundation

enum Operator {
    case plus
    case minus
    case multifly
    case divide

    var calculate: (Double, Double) -> Double {
        switch self {
        case .plus:
            return (+)
        case .minus:
            return (-)
        case .multifly:
            return (*)
        case .divide:
            return (/)
        }
    }
}


struct OperationQueue {
    var oprationNumber: Double
    var operationFlag: Operator
}

