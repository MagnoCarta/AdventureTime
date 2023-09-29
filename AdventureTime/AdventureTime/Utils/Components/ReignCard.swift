//
//  ReignCard.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI


struct ReignCard: View {
    
    @Binding var reino: Reino
    @Binding var direction: Direction
    
    @State private var dragAmout: CGSize = .zero
    @State private var cardAngle: Angle = .zero
    
    private let duration: CGFloat = 0.18
    private let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 25.0, height: 25.0))
            .fill(.shadow(.inner(radius: 3)))
            .foregroundStyle(.white)
            .overlay(alignment: .top) {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(spacing: 16) {
                        Image(reino.nome)
                            .resizable()
                            .frame(height: 181)
                        Text(reino.subtitulo)
                            .font(.largeTitle)
                            .bold()
                        Text(reino.descricao)
                    }
                    HStack(spacing: 16) {
                        VStack {
                            Image(reino.nomeDoLider)
                                .resizable()
                                .frame(width: 103, height: 108)
                        }
                        Text(reino.descricaoDoLider)
                            .font(.footnote)
                    }
                }
                .padding()
            }
            .star(isFilled: $reino.taFavoritado, color: reino.cor)
            .cornerRadius(25)
            .offset(dragAmout)
            .rotationEffect(cardAngle)
            .frame(width: 344,height: 508)
            .gesture(
                DragGesture()
                    .onChanged(dragDidChange)
                    .onEnded(dragDidEnd)
            )
    }
    
    // TODO: Desafio -> Entender e Desbravar os Gestures!
    private func dragDidChange(_ gesture: DragGesture.Value) {
        dragAmout = gesture.translation
        cardAngle = Angle(degrees: gesture.translation.width * 0.05)
        
        if gesture.translation.width > 0 && direction != .right {
            withAnimation(.linear(duration: duration)) {
                direction = .right
            }
        }
        
        if gesture.translation.width < 0 && direction != .left {
            withAnimation(.linear(duration: duration)) {
                direction = .left
            }
        }
        
        if gesture.translation == .zero && direction != .none {
            withAnimation(.linear(duration: duration)) {
                direction = .none
            }
        }
    }
    
    private func dragDidEnd(_ gesture: DragGesture.Value) {
        var reinoAtual = UserDefaults.standard.integer(forKey: "reinoAtual")
        let numeroDeReinos = UserDefaults.standard.integer(forKey: "numeroDeReinos")
        if direction == .left && reinoAtual > 0 {
            reinoAtual -= 1
        } else if direction == .right && reinoAtual < numeroDeReinos - 1 {
            reinoAtual += 1
        }
        UserDefaults.standard.set(reinoAtual, forKey: "reinoAtual")
        withAnimation(.linear(duration: duration)) {
            dragAmout = .zero
            cardAngle = .zero
            direction = .none
        }
    }
    
}
