//
//  ReignLayout.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 27/09/23.
//

import SwiftUI

struct LayoutReino<Segmento: View>: View {
    var cor: Color
    var titulo: Text
    var card: CardReino
    var segmento: () -> Segmento
    
    var body: some View {
        ZStack {
            cor.ignoresSafeArea()
            VStack(spacing: 40) {
                titulo
                VStack(spacing: 60) {
                    card
                    segmento()
                }
                .padding(.bottom, 40)
            }
            .padding(.top, 90)
        }
    }
    
}
