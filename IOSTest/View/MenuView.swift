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
    
    // Constants
    let backgroundOpacity = 0.3
    let menuWidthRatio = 0.6
    let menuPadding = 5.0
    let menuAnimationDelay = 0.25
    let swipeThreshold = 100.0
    
    // MARK: - View
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(backgroundOpacity))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(menuAnimationDelay))
            .onTapGesture {
                self.menuClose()
            }
            HStack {
                GeometryReader { geometry in
                    VStack {
                        CardView(color: Color.blue)

                    }
                    .padding(.all, 5)
                    .accessibilityIdentifier("cardViewMenu")
                    
                }
                .frame(width: UIScreen.main.bounds.width * menuWidthRatio)
                .background(Color.blue)
                .offset(x: self.isOpen ? self.dragOffset.width : -UIScreen.main.bounds.width * menuWidthRatio)
                .animation(.default)
                
                Spacer()
            }
        }
        .gesture(DragGesture()
            .updating($dragOffset, body: { value, state, _ in
                state = value.translation
            })
                .onEnded({ value in
                    if value.translation.width > swipeThreshold {
                        self.menuClose()
                    }
                })
        )
        .accessibilityIdentifier("menuView")
    }
}

// MARK: - Preview
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(isOpen: true, menuClose: {})
    }
}

