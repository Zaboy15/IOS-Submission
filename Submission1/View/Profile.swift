//
//  Profile.swift
//  Submission1
//
//  Created by zakario lesrahmanto on 31/07/20.
//  Copyright © 2020 zakario. All rights reserved.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            
            VStack {
                Image("profile")
                    .resizable()
                    .frame(width: 200, height: 300, alignment: .top)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 5)
                Text("Zakario Lesrahmanto")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                
            }
        }
    .navigationBarTitle("About")
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
