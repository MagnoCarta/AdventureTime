//
//  ReignView.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI


struct ReignView: View {
    
    @Binding var reino: Reino
    @State private var direcao: Direcao = .none
    @AppStorage("reinoAtual") var reinoAtual: Int = 0
    
    @State private var dragAmout: CGSize = .zero
    @State private var cardAngle: Angle = .zero
    
    private let duration: CGFloat = 0.18
    private let screenSize = UIScreen.main.bounds.size
    
    var size: CGFloat = 45
    
    var body: some View {
        LayoutReino(cor: cor,
                    titulo: title,
                    card: card) {
            segment
        }
    }
    
    var title: Text {
        Text(reino.nome.uppercased())
            .foregroundStyle(.white)
            .font(.largeTitle)
            .bold()
    }
    
    var card: CardReino {
        CardReino(reino: $reino,direcao: $direcao)
    }
    
    var cor: Color {
        reino.cor
        
    }
    
    var segment: some View {
        Segment(points: 4, selectedPoint: reinoAtual, color: .white)
            .animation(.easeInOut, value: reinoAtual)
    }
}
