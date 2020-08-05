//
//  GetImage.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 04/08/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI
import Combine

class GetImage: ObservableObject {
   
    @Published var downloadImage: UIImage?
    
    func get(url: String) {
        guard let imageURL = URL(string: url) else {
            fatalError("The url is not valid")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                fatalError("error reading image")
            }
            
            DispatchQueue.main.async {
                self.downloadImage = UIImage(data: data)
                
            }
        }.resume()
    }
}

