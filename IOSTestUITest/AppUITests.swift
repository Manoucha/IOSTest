//
//  AppUITests.swift
//  IOSTest
//
//  Created by macbook on 9/4/2023.
//

import XCTest

final class AppUITests: XCTestCase {
    
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
        
        let button = app.buttons["myButtonCardView"]
        print(app.debugDescription)
        XCTAssertTrue(button.exists)
        
        // Get the initial count of myCaptureText elements in the ScrollView
        let myscrollView = app.scrollViews["myScrollViewCardView"]
        let initialCount = app.staticTexts.matching(identifier: "myCaptureText").count
        
        
        // Tap the button that triggers the update of the array
        app.buttons["myButtonCardView"].tap()
        print(app.debugDescription)
        
        XCTAssertTrue(myscrollView.waitForExistence(timeout: 9))
        
        // Get the updated count of myCaptureText elements in the ScrollView
        let updatedCount = app.staticTexts.matching(identifier: "myCaptureText").count
        
        // Assert that the updated count is greater than the initial count
        XCTAssertEqual(updatedCount, 3)
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
