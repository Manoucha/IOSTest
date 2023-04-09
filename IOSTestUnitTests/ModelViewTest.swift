//
//  ModelViewTest.swift
//  IOSTestUITests
//
//  Created by macbook on 7/4/2023.
//

import XCTest
@testable import IOSTest

final class ModelViewTest: XCTestCase {

    /**
     Test  the time capture when an array is empty and when it already contains data
     */
    func testUpdateCapture() {
        
        let viewModel = CaptureTimeViewModel()
        viewModel.updateCapture()
        
        XCTAssertEqual(viewModel.timeCaptureArray.count, 1)
        
        let captureTime = viewModel.timeCaptureArray.first
        XCTAssertNotNil(captureTime)
    }


}
