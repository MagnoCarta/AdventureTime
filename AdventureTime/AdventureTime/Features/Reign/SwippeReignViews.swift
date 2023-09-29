//
//  ReignViewModel.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI

struct SwippeReignViews: View {
    
    @State var reinos: [Reino] = [
        .init(nome: "Reino Gelado",
              subtitulo: "Tour Gelado!",
              descricao: "O Reino Gelado é um belíssimo reino habitado por diversas criaturas de gelo",
              nomeDoLider: "Rei Gelado",
              descricaoDoLider: "O Rei Gelado é um belíssimo ser! Ele comanda o Reino gelado e tem como pet Gunter!",
              taFavoritado: false,
              cor: Color("ReiGeladoColor")),
        .init(nome: "Reino Doce",
              subtitulo: "Tour Doce!",
              descricao: "O Reino Doce é um lugar mágico e delicioso onde doces e sobremesas reinam supremos.",
              nomeDoLider: "Princesa Jujuba",
              descricaoDoLider: "Conhecida por sua inteligência excepcional, habilidades científicas e sua personalidade doce, mas determinada.",
              taFavoritado: false,
              cor: Color("JujubaColor")),
        .init(nome: "Reino de Fogo",
              subtitulo: "Tour Fogo!",
              descricao: "O Reino de Fogo  é um lugar mágico e caótico, dominado por criaturas flamejantes.",
              nomeDoLider: "Princesa de Fogo",
              descricaoDoLider: "Apesar de sua personalidade impulsiva, a Princesa do Fogo é leal aos seus súditos e desempenha um papel importante na política e na proteção de seu reino.",
              taFavoritado: false,
              cor: Color("PrincesaDeFogoColor")),
        .init(nome: "Casa da Árvore",
              subtitulo: "Tour Árvore!",
              descricao: "A casa da árvore é o local onde FInn e Jake moram e vivem altas aventuras.",
              nomeDoLider: "Finn",
              descricaoDoLider: "Sua personalidade destemida e disposição para ajudar os outros o tornam um herói adorado.",
              taFavoritado: false,
              cor: Color("FinnColor"))
    ]
    
    init() {
        UserDefaults.standard.set(reinos.count, forKey: "numeroDeReinos")
    }
    
    @AppStorage("reinoAtual") var reinoAtual: Int = 0
    
    var body: some View {
        ReignView(reino: $reinos[reinoAtual])
    }
    
}
