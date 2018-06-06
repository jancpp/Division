//
//  DivisionTests.swift
//  DivisionTests
//
//  Created by Jan Polzer on 6/3/18.
//  Copyright © 2018 Apps KC. All rights reserved.
//

import XCTest
@testable import Division

class DivisionTests: XCTestCase {
    
    let calculatorBrain = CalculatorBrain()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test10DividedBy5MustBe2() {
        calculatorBrain.divideTwoNumbers(dividend: 5, divisor: 2) { (result, error) in
            XCTAssert(result == 2, "Result must be 2")
        }
        
    }
    
    func test10DividedBy0MustBeNil() {
        calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 0) { (result, error) in
            XCTAssertNil(result, "Result must be nil")
            XCTAssert(error!.domain == "Error dividing by zero", "Error message shold be: 'Error dividing by zero'")
        }
    }
    
    func testTestDivisionTime() {
        measure {
            self.calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 2, completion: { (result, error) -> Void in
            })
        }
    }
}
