//
//  LoadImage.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 31/07/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI

struct LoadImage: View {
    
    @ObservedObject var getImage = GetImage()
    
     
    var placeholder: Image
     
     init(url: String, placeholder: Image = Image(systemName: "photo")) {
         self.placeholder = placeholder
         getImage.get(url: url)
     }
    
    var body: some View {
        if let image = self.getImage.downloadImage {
            return Image(uiImage: image).resizable()
        }
        return placeholder
    }
}

struct LoadImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadImage(url: "")
    }
}
