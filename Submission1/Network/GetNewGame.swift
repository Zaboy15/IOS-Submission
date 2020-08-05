//
//  GetNewGame.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 31/07/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI
import Combine

class GetNewGame: ObservableObject {
    @Published var games = [Game]()
    
    func getData() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let today = Date() // string purpose I add here

        let getDay = Calendar.current.date(byAdding: .month, value: -1, to: today)

        let currentDate = formatter.string(from: today)

        let fromDate = formatter.string(from: getDay!)

        let point = "https://api.rawg.io/api/games?dates="

        let target = point + fromDate + "," + currentDate
        
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
            let games = try! decoder.decode(Games.self, from: data)
            DispatchQueue.main.async {
                self.games = games.games
               
            }
        }
    }
    
    
}
