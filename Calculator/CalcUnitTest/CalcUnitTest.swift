//
//  CalcUnitTest.swift
//  CalcUnitTest
//
//  Created by 서현웅 on 2022/09/19.
//

import XCTest
@testable import Calculator

class Calculator: XCTestCase {
    
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue(opreandList: [OperationQueue(oprationNumber: 10, operationFlag: .plus)])
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_calculateAllQueue_호출하여baseNumber_10_일때합이_20_이맞는지() {
        // given
        let input:Double = 10.0
        
        // when
        let result = sut.calculateAllQueue(baseNumber: input)
        
        // then
        XCTAssertEqual(result, 20.0)
    }
}
