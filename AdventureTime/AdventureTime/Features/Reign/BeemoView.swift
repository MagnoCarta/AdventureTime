//
//  BeemoView.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 29/09/23.
//

import SwiftUI

struct BeemoView: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                Text("Olá Pessoa Atrás da tela! Eu quero muito poder viajar pelos reinos de OOO, mas tenho medo de ir só, você pode vir comigo!? para você será como mexer em cartinhas!, se decidir ir, quando estiver pronto basta clicar no botão abaixo")
                Image("Beemo")
                    .resizable()
                    .frame(width: 150, height: 150)
                NavigationLink(destination: {
                    SwippeReignViews()
                         .navigationBarBackButtonHidden()
                }, label: {
                    Text("Visitar os Reinos")
                        .frame(maxWidth: .infinity, alignment: .center)
                })
                    .buttonStyle(ATButtonStyle())
                    .padding()
            }
        }
    }
}


import SwiftUI

struct ATButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(height: 48)
            .background {
                Rectangle()
                    .fill(Color.black)
                    .cornerRadius(10)
            }
    }
}
