//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        return Formula(operands: CalculatorItemQueue(queue: ["0"]), operators: CalculatorItemQueue(queue: ["+"]))
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        return [""]
    }
}
