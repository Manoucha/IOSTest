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
    
    //Constants
    let cardWidth: CGFloat = 220
    let cardHeight: CGFloat = 220
    let cardCornerRadius: CGFloat = 16
    let cardShadowRadius: CGFloat = 10
    let trailingPadding: CGFloat = 20
    let topPadding: CGFloat = 20
    
    // MARK: - View
    var body: some View {
        
        VStack {
            
            Button(action: {
                // action
                CaptureTimeViewModel.shared.updateCapture()
            })
            {
                Text(NSLocalizedString("button.title", comment: ""))
            }
            .padding()
            .tint(Color.white)
            .accessibilityIdentifier("myButtonCardView")

            ScrollView {
                // scroll view content
                
                ForEach(CaptureTimeViewModel.shared.timeCaptureArray) { capture in
                    Text(capture.formattedDate())
                        .foregroundColor(Color.white)
                        .accessibilityIdentifier("myCaptureText")
                } 
            }
            .padding(.horizontal)
            .accessibilityIdentifier("myScrollViewCardView")
        }
        .frame(width: cardWidth, height: cardHeight)
        .background(self.color)
        .cornerRadius(cardCornerRadius)
        .shadow(radius: cardShadowRadius)
        .padding(.trailing, trailingPadding)
        .padding(.top, topPadding)
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(color: Color.green)
    }
}
