//
//  PopupView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct PopupView: View {
    
    // MARK: - Properties
    @ObservedObject var captureViewModel: CaptureTimeViewModel
    
    // MARK: - View
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top))
        {
            Rectangle ()
                .foregroundColor(Color.orange)
                .scaledToFit()
                .opacity(0.8)
                .padding(10)
            CardView(captureTimeArray: captureViewModel.timeCaptureArray ?? [], btnAction: captureViewModel.updateCapture, color: Color.orange)
            
        }
    }
}
    // MARK: - Preview
struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        let captureViewModel = CaptureTimeViewModel()
        PopupView(captureViewModel: captureViewModel)
    }
}
