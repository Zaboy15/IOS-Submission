//
//  GetDetailGame.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 05/08/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI
import Combine

class GetDetailGame: ObservableObject {
    @Published var loading = false
    @Published var dataGames : DetailGame?
    
    
    func getData(idGame: Int) {
        self.loading = true
        
        let baseurl = "https://api.rawg.io/api/games/"
        
        let target = baseurl+String(idGame)
        
        print(target)
        
        let components = URLComponents(string: target)!
        
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
            let games = try! decoder.decode(DetailGame.self, from: data)
           
            DispatchQueue.main.async {
                
                self.dataGames = games
                self.loading = false
            }
            
        }
    }
    
}
