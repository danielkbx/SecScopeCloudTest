//
//  Cloud_TestUITests.swift
//  Cloud TestUITests
//
//  Created by Daniel Wetzel on 27.07.23.
//

import XCTest

final class Cloud_TestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
                
        app.windows/*@START_MENU_TOKEN@*/.buttons["Click me"]/*[[".groups.buttons[\"Click me\"]",".buttons[\"Click me\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.click()
        app.dialogs.buttons.matching(identifier: "OKButton").element.click()
        
        let statePlain = app.windows.staticTexts.matching(identifier: "statePlain").element.value as? String
        XCTAssertEqual(statePlain, "bookmarked")
        let stateScoped = app.windows.staticTexts.matching(identifier: "stateScoped").element.value as? String
        XCTAssertEqual(stateScoped, "bookmarked")    
        
        let screenshot = app.windows.firstMatch.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
}
