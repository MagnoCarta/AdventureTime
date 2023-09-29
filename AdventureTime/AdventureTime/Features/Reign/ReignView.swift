//
//  ReignView.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI


struct ReignView: View {
    
    @Binding var reino: Reino
    @State private var direction: Direction = .none
    @AppStorage("reinoAtual") var reinoAtual: Int = 0
    
    var body: some View {
        ZStack {
            reino.cor.ignoresSafeArea()
            VStack(spacing: 48) {
                Text(reino.nome.uppercased())
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                VStack(spacing: 40) {
                    ReignCard(reino: $reino,direction: $direction)
                        .padding(.bottom, 40)
                    Segment(points: 4, selectedPoint: reinoAtual, color: .white).animation(.easeInOut, value: reinoAtual)
                }
                .padding(.bottom, 40)
            }
            .padding(.top, 100)
        }
    }
    
}
