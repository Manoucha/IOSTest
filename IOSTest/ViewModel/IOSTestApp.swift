//
//  IOSTestApp.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

@main
struct IOSTestApp: App {
    var body: some Scene {
        WindowGroup {
            let captureViewModel = CaptureTimeViewModel()
            MainView(captureViewModel: captureViewModel)
        }
    }
}
