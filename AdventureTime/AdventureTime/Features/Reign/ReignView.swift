//
//  ReignView.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI


struct ReignView: View {
    
    var reign: Reign
    
    var body: some View {
        ZStack {
            reign.color.ignoresSafeArea()
            VStack(spacing: 48) {
                Text(reign.name.uppercased())
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                VStack(spacing: 40) {
                    ReignCard(reign: reign)
                        .padding(.bottom, 40)
                    Segment(points: 4, selectedPoint: 2, color: .white)
                }
                .padding(.bottom, 40)
            }
            .padding(.top, 100)
        }
    }
    
}
