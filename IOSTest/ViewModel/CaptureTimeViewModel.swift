//
//  TimeCaptureViewModel.swift
//  IOSTest
//
//  Created by macbook on 6/4/2023.
//

import Foundation

class CaptureTimeViewModel : ObservableObject
{
    /// Singleton pattern
    static let shared = CaptureTimeViewModel()
    
    @Published var notificationReceived = false
    @Published var timeCaptureArray: [CaptureTime]
    
    init() {
        self.timeCaptureArray = []
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: Notification.Name("buttonTappedNotification"), object: nil)

    }
    @objc func handleNotification() {
        notificationReceived = true
        updateCapture()
    }
    
    /**
     Updates the `timeCaptureArray` property by appending a new `CaptureTime` object with the current date.
     
     If `timeCaptureArray` is nil, the method initializes it with a new `CaptureTime` object.
     */
    
    func updateCapture() {

        let captureTime = CaptureTime(time: Date())
        self.timeCaptureArray.append(captureTime)
        
    }
    
    
    
}
