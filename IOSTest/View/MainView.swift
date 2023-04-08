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
    
    //Constants
    let vstackPadding: CGFloat = 20

    
    // MARK: - View
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Color.green.edgesIgnoringSafeArea(.all)
            
            /// The cardView displaying the captured times
            CardView(color: Color.green)
                .accessibilityIdentifier("mainCardView")
               
                
            
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
            

           
        }  /*.onReceive(NotificationCenter.default.publisher(for: .buttonTappedNotification)) { _ in
            // Do something in response to the notification
            CaptureTimeViewModel.shared.updateCapture()
            print("it's working")
        }
        */

    }
    // MARK: - Preview
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
