//
//  Star.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI

struct Star: ViewModifier {
    
    @State var isFilled: Bool
    var color: Color
    var size: CGFloat = 45
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .trailing) {
                VStack {
                    Spacer()
                    Button("") {}.buttonStyle(StarStyle(isFilled: $isFilled, color: color, size: size))
                }
                .padding(8)
            }
    }
}

extension View {
    func star(isFilled: Bool, color: Color) -> some View {
        modifier(Star(isFilled: isFilled, color: color))
    }
}
