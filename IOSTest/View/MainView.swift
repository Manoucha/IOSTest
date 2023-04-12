//
//  ContentView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @State var menuOpen: Bool = false
    @ObservedObject var viewModel = CaptureTimeViewModel.shared
    
    //Constants
    let vstackPadding: CGFloat = 20
    
    
    // MARK: - View
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Color.green.edgesIgnoringSafeArea(.all)
            
            /// The cardView displaying the captured times
            CardView(color: Color.green)
            
            
            /// Adds a popup view for capturing time
            VStack {
                Spacer()
                PopupView()
                    .padding(vstackPadding)
            }
            /// Adds a side menu
            MenuView(
                isOpen: self.menuOpen,
                menuClose: {self.menuOpen.toggle()})
            
        }.onReceive(NotificationCenter.default.publisher(for: Notification.Name("buttonTappedNotification"))) { _ in
            
            viewModel.updateCapture()
        }
        
        
    }
    // MARK: - Preview
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
