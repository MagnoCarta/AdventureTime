//
//  Segment.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI

struct Segment: View {
    
    var points: Int
    var selectedPoint: Int
    var color: Color
//    var actionLeft: () -> Void
//    var actionRight: () -> Void
    
    var body: some View {
        
        HStack {
//            Button(""){ actionLeft() }
//            .buttonStyle(ArrowStyle(direction: .left))
            ForEach(0..<4) { point in
                Circle()
                    .frame(width: 10,height: 10)
                    .foregroundStyle(point == selectedPoint ? color : .gray)
            }
//            Button(""){ actionRight() }
//            .buttonStyle(ArrowStyle(direction: .right))
        }
        
    }
}
