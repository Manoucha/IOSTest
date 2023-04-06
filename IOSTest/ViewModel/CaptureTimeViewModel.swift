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
