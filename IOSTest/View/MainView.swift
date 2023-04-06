//
//  ContentView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @ObservedObject var captureViewModel: CaptureTimeViewModel
    @State var menuOpen: Bool = false
    
    
    // MARK: - View
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Color.green.edgesIgnoringSafeArea(.all)
            
            /// The cardView displaying the captured times
            CardView(captureTimeArray: captureViewModel.timeCaptureArray ?? [], btnAction: captureViewModel.updateCapture)
            
            // Adds a popup view for capturing time
            VStack {
                Spacer()
                PopupView(captureViewModel: captureViewModel)
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                
            }
            
            // Adds a side menu
            MenuView(
                captureViewModel: captureViewModel,
                isOpen: self.menuOpen,
                menuClose: {self.menuOpen.toggle()})
        }
        
        
        
    }
    // MARK: - Preview
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            let captureViewModel = CaptureTimeViewModel()
            MainView(captureViewModel: captureViewModel)
        }
    }
}
