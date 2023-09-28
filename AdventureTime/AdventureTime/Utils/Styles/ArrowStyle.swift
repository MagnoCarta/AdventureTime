//
//  ArrowStyle.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI

struct ArrowStyle: ButtonStyle {
    
    var direction: Direction
    
    func makeBody(configuration: Configuration) -> some View {
        Image(systemName: "arrow.\(direction.rawValue)")
            .font(.headline)
    }
    
}

enum Direction: String {
    case left
    case right
}
