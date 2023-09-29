//
//  StarStyle.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 27/09/23.
//

import SwiftUI

struct StarStyle: ButtonStyle {
    
    @Binding var isFilled: Bool
    var color: Color
    var size: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: isFilled ? "star.fill" : "star")
            .resizable()
            .fontWeight(.thin)
            .foregroundStyle(color)
            .frame(width: size,height: size)
    }
    
    
}
