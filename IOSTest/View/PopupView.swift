//
//  PopupView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct PopupView: View {
    
    @ObservedObject var captureViewModel: CaptureTimeViewModel
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top))
        {
            Rectangle ()
                .foregroundColor(Color.orange)
                .scaledToFit()
                .opacity(0.8)
            CardView(captureTimeArray: captureViewModel.timeCaptureArray ?? [], btnAction: captureViewModel.updateCapture)

        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        let captureViewModel = CaptureTimeViewModel()
        PopupView(captureViewModel: captureViewModel)
    }
}
