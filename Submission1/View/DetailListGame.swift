//
//  DetailListGame.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 31/07/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI

struct DetailListGame: View {
    @ObservedObject var getGame = GetDetailGame()
    var game: Game
    var body: some View {
        ScrollView {
            
            Group{
                if (getGame.loading == true){
                    ActivityIndicator().frame(width: 50, height: 50)
                } else {

                VStack(alignment: .center, spacing: 0) {
                    LoadImage(url: game.image)
                        .frame(height: 250)
                        .aspectRatio(contentMode: .fit)
                        
                    
                    LoadImage(url: game.image)
                    .frame(height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .offset(y: -150)
                    .padding(.bottom, -130)
                    
                    VStack {
                            Text("Genres :")
                            HStack{
                                
                                ForEach(0..<game.genre.count) { genres in
                                    Text(self.game.genre[genres].name)
                              }
                            }
                        }
                    
                    
                    HStack {
                       VStack() {
                        Text("Release Date :")
                            .font(.footnote)
                            .fontWeight(.medium)
                        HStack(spacing: 0){
                            Image(systemName: "clock.fill")
                                .offset(x: -5)
                            Text(String(getGame.dataGames?.released ?? "0000-00-00"))
                                .font(.footnote)
                            }
                        Text("Review Count :")
                            .font(.footnote)
                            .fontWeight(.medium)
                        HStack(spacing: 0){
                            Image(systemName: "eye.fill")
                                .offset(x: -5)
                            Text(String(game.reviews_count))
                                .font(.footnote)
                           }
                       }
                       
                       
                       
                       Spacer()
                        
                        
                        
                       VStack() {
                            Text("Ratings Count :")
                            .font(.footnote)
                            .fontWeight(.medium)
                        HStack(spacing: 0){
                            Image(systemName: "star.circle.fill")
                                .offset(x: -5)
                            Text(String(game.genre[0].name))
                                .font(.footnote)
                            }
                        Text("Rating :")
                            .font(.footnote)
                            .fontWeight(.medium)
                        HStack(spacing: 0){
                            Image(systemName: "star.fill")
                                .offset(x: -5)
                            Text(String(game.rating))
                                .font(.footnote)
                                
                           }
                       }
                       
                   }.padding()
                        
                        VStack {
                            Text("Website :")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 18))
                                .font(.footnote)
                            Text(getGame.dataGames?.website ?? "")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 15))
                                .font(.footnote)
                            Spacer()
                            Text("Description :")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 18))
                                .font(.footnote)
                        Text(getGame.dataGames?.description_raw ?? "Description")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                            .font(.footnote)
                                       }.padding()
                        
                    
                    Spacer()
                }

                }
                
            }
            .navigationBarTitle("\(game.name)", displayMode: .inline)
            .onAppear(perform: {self.getGame.getData(idGame: self.game.id)})
        }
    }
}
