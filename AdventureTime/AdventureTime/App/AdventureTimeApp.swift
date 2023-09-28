//
//  AdventureTimeApp.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 27/09/23.
//

import SwiftUI

@main
struct AdventureTimeApp: App {
    
    @State var test: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ReignView(reign: Reign(leaderName: "Princesa de Fogo", leaderDescription: "Apesar de sua personalidade impulsiva, a Princesa do Fogo é leal aos seus súditos e desempenha um papel importante na política e na proteção de seu reino.", name: "Reino de Fogo", subtitle: "Tour de Fogo!", description: "O Reino de Fogo  é um lugar mágico e caótico, dominado por criaturas flamejantes.", isFavorite: true, color: .princesaDeFogo))
        }
    }
}
