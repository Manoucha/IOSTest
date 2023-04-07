//
//  MenuView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct MenuView: View {
    
    // MARK: - Properties
    let isOpen: Bool
    let menuClose: () -> Void
    @GestureState private var dragOffset = CGSize.zero
    
    
    // MARK: - View
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                GeometryReader { geometry in
                    VStack {
                        CardView(color: Color.blue)
                        
                        
                    }
                        .padding(.all, 5)
                    
                }
                .frame(width: UIScreen.main.bounds.width * 0.6)
                .background(Color.blue)
                .offset(x: self.isOpen ? self.dragOffset.width : -UIScreen.main.bounds.width * 0.6)
                .animation(.default)
                
                Spacer()
            }
        }
        .gesture(DragGesture()
            .updating($dragOffset, body: { value, state, _ in
                state = value.translation
            })
                .onEnded({ value in
                    if value.translation.width > 100 {
                        self.menuClose()
                    }
                })
        )
    }
}

// MARK: - Preview
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        let captureViewModel = CaptureTimeViewModel()
        MenuView(isOpen: true, menuClose: {})
    }
}

