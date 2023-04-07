//
//  PopupView.swift
//  IOSTest
//
//  Created by macbook on 5/4/2023.
//

import SwiftUI

struct PopupView: View {
    
   
    // MARK: - View
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top))
        {
            Rectangle ()
                .foregroundColor(Color.orange)
                .scaledToFit()
                .opacity(0.8)
                .padding(10)
            CardView(color: Color.orange)
            
        }
    }
}
    // MARK: - Preview
struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}
