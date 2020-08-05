//
//  RowGame.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 31/07/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI

struct RowGame: View {
    
    var game: Game
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                LoadImage(url: game.image)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    
                VStack(alignment: .leading ,spacing: 0) {
                    Text(game.name)
                        .font(.system(size: 18))
                    Spacer()
                    HStack {
                        Text("Rate : \(String(game.rating))").font(.system(size: 16))
                    }
                    Spacer()
                    Text("Release Date: \(game.released)").font(.system(size: 16))
                }
                .padding(.leading, 8)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
            
        }
    }
}

struct RowGame_Previews: PreviewProvider {
    static var previews: some View {
        RowGame(game: GetGame().games[1]).previewLayout(.sizeThatFits)
    }
}
