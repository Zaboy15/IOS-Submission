//
//  GetGame.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 31/07/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI
import Combine

class GetGame: ObservableObject {
    @Published var loading = false
    @Published var games = [Game]()
    
    func getData() {
        self.loading = true
        let components = URLComponents(string: "https://api.rawg.io/api/games")!
        
        let request = URLRequest(url: components.url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            
            if response.statusCode == 200 {
                decodeJSON(data: data)
                
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        
        task.resume()
        
        
        func decodeJSON(data: Data) {
            
            let decoder = JSONDecoder()
            let games = try! decoder.decode(Games.self, from: data)
            DispatchQueue.main.async {
                
                self.games = games.games
                self.loading = false
                
            }
        }
    }
    
}
