//
//  CardView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Properties
    @ObservedObject var captureViewModel: CaptureTimeViewModel = CaptureTimeViewModel.shared
    var color: Color
    
    // MARK: - View
    var body: some View {
        
        VStack {
            
            Button("Button") {
                // button action
                CaptureTimeViewModel.shared.updateCapture()
                
            }
            .padding()
            .tint(Color.white)
            
            ScrollView {
                // scroll view content
                ForEach(CaptureTimeViewModel.shared.timeCaptureArray) { capture in
                    Text(capture.formattedDate())
                        .foregroundColor(Color.white)
                }
            }
            .padding(.horizontal)
        }
        .frame(width: 220, height: 220)
        .background(self.color)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding(.trailing, 20)
        .padding(.top, 20)
        
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let captureTimeArray: [CaptureTime] = [
            CaptureTime(time: Date()),
            CaptureTime(time: Date().addingTimeInterval(60)),
            CaptureTime(time: Date().addingTimeInterval(120))
        ]
        CardView(color: Color.green)
    }
}
