//
//  AppUITests.swift
//  IOSTest
//
//  Created by macbook on 9/4/2023.
//

import XCTest

final class AppUITests: XCTestCase {
    
    ///  Test that the Scrollview is updated correctly in all views when the button is clicked
    
    func testScrollViewUpdatedWhenButtonClicked() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let buttonsQuery = app.buttons.matching(identifier: "myButtonCardView")
        let button = buttonsQuery.element(boundBy: 0)
        print(app.debugDescription)
        XCTAssertTrue(button.exists)
        
        // Get the initial count of myCaptureText elements in the ScrollView
        let myscrollView = app.scrollViews["myScrollViewCardView"]
        XCTAssertTrue(myscrollView.waitForExistence(timeout: 9))

        
        // Tap the button that triggers the update of the array
        button.tap()
        print(app.debugDescription)
        
        // Get the updated count of myCaptureText elements in the ScrollView
        let updatedCount = app.staticTexts.matching(identifier: "myCaptureText").count
        
        // Assert that the updated count is equal to 3 as I have 3 cardViews in my App
        XCTAssertEqual(updatedCount, 3)
    }
    
    /// Test to measure the time it takes to update the scrollView after button click

    func testMesureTimeToUpdateScrollView () throws {
        
        let app = XCUIApplication()
        app.launch()
        
        // Find and tap a button that updates the scroll view
        let buttonsQuery = app.buttons.matching(identifier: "myButtonCardView")
        let button = buttonsQuery.element(boundBy: 0)
        print(app.debugDescription)
        XCTAssertTrue(button.exists)
        
        button.tap()
        
        // Measure the time it takes to update the scroll view
        let start = Date()
        
        // Find the updated scroll view
        let updatedScrollView = app.scrollViews["myScrollViewCardView"]
        
        // Wait for the updated scroll view to be visible
        XCTAssertTrue(updatedScrollView.waitForExistence(timeout: 5))
        
        // Find the text element in the updated scroll view
        let myCaptureText = app.staticTexts.matching(identifier: "myCaptureText").element
        // Wait for the text element to be visible
        XCTAssertTrue(myCaptureText.waitForExistence(timeout: 5))
        
        let end = Date()
        let timeInterval = end.timeIntervalSince(start)
        print("Time to update scroll view: \(timeInterval)")
    }
    func testLaunchPerformance() throws {
        if #available(iOS 16.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
            
        }
    }
}
