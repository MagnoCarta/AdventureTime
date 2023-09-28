//
//  ReignCard.swift
//  AdventureTime
//
//  Created by Gilberto Magno on 28/09/23.
//

import SwiftUI


struct ReignCard: View {
    
    var reign: Reign
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            RoundedRectangle(cornerSize: CGSize(width: 25.0, height: 25.0))
                .fill(.shadow(.inner(radius: 3)))
                .foregroundStyle(.white)
                .overlay {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(spacing: 16) {
                            Image(reign.name)
                                .resizable()
                                .frame(height: 181)
                            Text(reign.subtitle)
                                .font(.largeTitle)
                                .bold()
                            Text(reign.description)
                                .lineLimit(nil)
                        }
                        HStack(spacing: 16) {
                            VStack {
                                Image(reign.leaderName)
                                    .resizable()
                                    .frame(width: 103, height: 108)
                             //   Text(reign.leaderName)
                            }
                            Text(reign.leaderDescription)
                                .font(.caption)
                                .lineLimit(nil)
                        }
                    }
                    .padding(.horizontal)
                }
            .star(isFilled: reign.isFavorite, color: reign.color)
        }
        .cornerRadius(25)
        .frame(width: 344,height: 508)
    }
}
