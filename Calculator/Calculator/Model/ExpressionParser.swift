//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 서현웅 on 2022/09/22.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula: Formula = Formula()
        
        let operands = componentsByOperators(from: input)
        let doubleOperands = operands.compactMap { Double($0)}
        
        doubleOperands.forEach {
            formula.operands.enqueue($0)
        }
        
        let operators = input.compactMap { Operator(rawValue: $0) }
        
        operators.forEach {
            formula.operators.enqueue($0)
        }
        return formula
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        let separatedToArray = input.components(separatedBy: ["+", "−", "×", "÷"])
        let trimmingSpaceArray = separatedToArray.filter({$0 != ""})
        return trimmingSpaceArray
    }
}
