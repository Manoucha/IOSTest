//
//  ContentView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct MainView: View {
    

    @ObservedObject var captureViewModel: CaptureTimeViewModel
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Color.green.edgesIgnoringSafeArea(.all)
            
            CardView(captureTimeArray: captureViewModel.timeCaptureArray ?? [], btnAction: captureViewModel.updateCapture)
            
            // ADD THE POPUP
            VStack {
                Spacer()
                PopupView(captureViewModel: captureViewModel)
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                   
                }
        }
    }
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            let captureViewModel = CaptureTimeViewModel()
            MainView(captureViewModel: captureViewModel)
        }
    }
}

