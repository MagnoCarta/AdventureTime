//
//  ReignCard.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI


struct CardReino: View {
    
    @Binding var reino: Reino
    @Binding var direcao: Direcao
    
    @State private var dragAmout: CGSize = .zero
    @State private var cardAngle: Angle = .zero
    
    private let duration: CGFloat = 0.18
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 25.0, height: 25.0))
            .fill(.shadow(.inner(radius: 3)))
            .foregroundStyle(.white)
            .overlay(alignment: .top) {
                conteudo
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
    
    var conteudo: some View {
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
    
    // TODO: Desafio -> Entender e Desbravar os Gestures!
    private func dragDidChange(_ gesture: DragGesture.Value) {
        dragAmout = gesture.translation
        cardAngle = Angle(degrees: gesture.translation.width * 0.05)
        
        if gesture.translation.width > 0 && direcao != .right {
            withAnimation(.linear(duration: duration)) {
                direcao = .right
            }
        }
        
        if gesture.translation.width < 0 && direcao != .left {
            withAnimation(.linear(duration: duration)) {
                direcao = .left
            }
        }
        
        if gesture.translation == .zero && direcao != .none {
            withAnimation(.linear(duration: duration)) {
                direcao = .none
            }
        }
    }
    
    private func dragDidEnd(_ gesture: DragGesture.Value) {
        var reinoAtual = UserDefaults.standard.integer(forKey: "reinoAtual")
        let numeroDeReinos = UserDefaults.standard.integer(forKey: "numeroDeReinos")
        if direcao == .left && reinoAtual > 0 {
            reinoAtual -= 1
        } else if direcao == .right && reinoAtual < numeroDeReinos - 1 {
            reinoAtual += 1
        }
        UserDefaults.standard.set(reinoAtual, forKey: "reinoAtual")
        withAnimation(.linear(duration: duration)) {
            dragAmout = .zero
            cardAngle = .zero
            direcao = .none
        }
    }
    
}
