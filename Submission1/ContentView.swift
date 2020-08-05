//
//  ContentView.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 31/07/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListGameView().tabItem{
                Image(systemName: "gamecontroller.fill")
                Text("List Game")

            }
           NewGameView().tabItem{
               Image(systemName: "gamecontroller.fill")
               Text("List New Game")

           }
        }.accentColor(.black)
    }
}

struct ActivityIndicator: View {
  @State private var isAnimating: Bool = false
  var body: some View {
    GeometryReader { (geometry: GeometryProxy) in
      ForEach(0..<5) { index in
        Group {
          Circle()
            .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
            .scaleEffect(!self.isAnimating ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)
            .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
           
          }.frame(width: geometry.size.width, height: geometry.size.height)
            .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
            .animation(Animation
              .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
              .repeatForever(autoreverses: false))
        }
      }.aspectRatio(1, contentMode: .fit)
        .onAppear {
          self.isAnimating = true
        }
    
  }

}

struct ListGameView: View {
    @ObservedObject var getGame = GetGame()
    var body: some View {
        NavigationView {
            Group{
                if (self.getGame.loading == false){
                    List(getGame.games) { game in
                        
                        NavigationLink(destination: DetailListGame(game: game)) {
                           RowGame(game: game)
                        }
                    }
                } else {
                    ActivityIndicator()
                      .frame(width: 50, height: 50)
                }
            }
            .navigationBarTitle("List Games", displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: Profile(), label: {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                    
                }))
                .onAppear(perform: self.getGame.getData)
        }
    }
}

struct NewGameView: View {
    @ObservedObject var getNewGame = GetNewGame()
    var body: some View {
        NavigationView {
            Group{
                if (self.getNewGame.games.isEmpty){
                    ActivityIndicator().frame(width: 50, height: 50)
                } else {
                    List(getNewGame.games) { game in
                        NavigationLink(destination: DetailListGame(game: game)) {
                           RowGame(game: game)
                        }
                    }
                }
                
            }
            .navigationBarTitle("List New Games", displayMode: .inline)
                .onAppear(perform: self.getNewGame.getData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
