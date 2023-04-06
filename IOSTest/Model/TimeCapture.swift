//
//  TimeCapture.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import Foundation

/**
 the Model representing the captured time
 */

struct CaptureTime : Identifiable {
    let id = UUID()
    var time: Date
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.string(from: self.time)
    }
}
