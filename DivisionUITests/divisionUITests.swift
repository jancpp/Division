//
//  DivisionUITests.swift
//  DivisionUITests
//
//  Created by Jan Polzer on 6/3/18.
//  Copyright © 2018 Apps KC. All rights reserved.
//

import XCTest

class DivisionUITests: XCTestCase {
    
    var app = XCUIApplication()
//    var device = XCUIDevice()
//    var element = XCUIElement()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMainScreen() {
        let labelText = app.staticTexts["Enter two numbers:"]
        XCTAssertTrue(labelText.exists, "Should on the main screen")
    }
    
    func testCalculate10dividedby2LabelResult() {
        let div1 = app.textFields.element(boundBy: 0)
        let div2 = app.textFields.element(boundBy: 1)
        div1.tap()
        div1.typeText("10")
        div2.tap()
        div2.typeText("2")
        app.buttons["Calculate"].tap()
        XCTAssertTrue(app.staticTexts["5"].exists, "Result should be displaying '5'")
        
    }
}
