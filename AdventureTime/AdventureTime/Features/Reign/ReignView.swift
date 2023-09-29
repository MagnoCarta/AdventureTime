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
        ZStack {
            reino.cor.ignoresSafeArea()
            VStack(spacing: 40) {
                Text(reino.nome.uppercased())
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                VStack(spacing: 60) {
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
                        .overlay(alignment: .trailing) {
                            VStack {
                                Spacer()
                                Button(action: {
                                    reino.taFavoritado.toggle()
                                }, label: {
                                    Image(systemName: reino.taFavoritado ? "star.fill" : "star")
                                        .resizable()
                                        .fontWeight(.thin)
                                        .foregroundStyle(reino.cor)
                                        .frame(width: size,height: size)
                                })
                            }
                            .padding(12)
                        }
                        .cornerRadius(25)
                        .offset(dragAmout)
                        .rotationEffect(cardAngle)
                        .frame(width: 344,height: 508)
                        .gesture(
                            DragGesture()
                                .onChanged(dragDidChange)
                                .onEnded(dragDidEnd)
                        )
                    HStack(spacing: 12) {
                        ForEach(0..<4) { point in
                            Circle()
                                .frame(width: 10,height: 10)
                                .foregroundStyle(point == reinoAtual ? .white : .gray)
                        }
                    }
                        .animation(.easeInOut, value: reinoAtual)
                }
                .padding(.bottom, 40)
            }
            .padding(.top, 90)
        }
    }

    
    
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
