//
//  TimeCaptureViewModel.swift
//  IOSTest
//
//  Created by macbook on 6/4/2023.
//

import Foundation
 

class CaptureTimeViewModel : ObservableObject
{
    
    @Published var timeCaptureArray: [CaptureTime]?
    
    /**
     Updates the `timeCaptureArray` property by appending a new `CaptureTime` object with the current date.
     
     If `timeCaptureArray` is nil, the method initializes it with a new `CaptureTime` object.
     */
    
    func updateCapture() {
        guard var capturesArray = self.timeCaptureArray else {
            let captureTime = CaptureTime(time: Date())
            self.timeCaptureArray = [captureTime]
            return
        }
        
        let captureTime = CaptureTime(time: Date())
        capturesArray.append(captureTime)
        self.timeCaptureArray = capturesArray
    }
    
    
}
