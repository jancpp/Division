//
//  onlineCalculatorTest.swift
//  DivisionTests
//
//  Created by Jan Polzer on 6/6/18.
//  Copyright © 2018 Apps KC. All rights reserved.
//

import XCTest

class onlineCalculatorTest: XCTestCase {
    
    let onlineCalc = OnlineCalculatorBrain()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
    }
    
    func testRetrieveURLFor10dividedBy2() {
        let url = NSURL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
        let response = onlineCalc.retrieveURLForDivison(dividend: 10, divisor: 2)
        XCTAssert(url == response, "URL must equeal to 'https://www.calcatraz.com/calculator/api?c=10%2F2'")
    }
    
    func testRetrieveURLFor10dividedBy2ShouldFail() {
        let url = NSURL(string: "https://www.calcatraz.com/calculator/api?c=10%2F2")
        let response = onlineCalc.retrieveURLForDivison(dividend: 20, divisor: 2)
        XCTAssert(url != response, "URL must not equeal to 'https://www.calcatraz.com/calculator/api?c=10%2F2'")
    }
    
    func testCalculateDivisionOnlineFor10DividedBy2ShouldBe5() {
        onlineCalc.calulateWithTwoNumbers(dividend: 10, divisor: 2) { (response, error) -> () in
            XCTAssert(response == 5, "Response should be 5")
        }
    }
    
    func testCalculateDivisionByZero() {
        
        let expected = expectation(description: "Expectated call back from API fail")
        
        onlineCalc.calulateWithTwoNumbers(dividend: 10, divisor: 0) { (response, error) -> () in
            if error == nil {
                XCTFail()
            } else {
                XCTAssert(error?.domain == "Division by zero", "Response should be 'Division by zero'")
                expected.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
   
}
