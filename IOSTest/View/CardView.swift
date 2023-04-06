//
//  CardView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct CardView: View {
    
    
    let captureTimeArray: [CaptureTime]
    let btnAction: () -> Void
    
    
    var body: some View {
  
            VStack {
             Button("Button") {
                // button action
                 btnAction ()
                 print(captureTimeArray.count)
                        }
                        .padding()
                     
                        ScrollView {
                            // scroll view content
                            ForEach(captureTimeArray) { capture in
                                Text(capture.formattedDate())
                            }
                        }
                        .padding(.horizontal)
                    }
                   .frame(width: 220, height: 220)
                   .background(Color.white)
                   .cornerRadius(16)
                   .shadow(radius: 10)
                   .padding(.trailing, 20)
                   .padding(.top, 20)

           }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let captureTimeArray: [CaptureTime] = [
            CaptureTime(time: Date()),
            CaptureTime(time: Date().addingTimeInterval(60)),
            CaptureTime(time: Date().addingTimeInterval(120))
        ]
        CardView(captureTimeArray: captureTimeArray, btnAction: { print(" I am clicked in test")})
    }
}
