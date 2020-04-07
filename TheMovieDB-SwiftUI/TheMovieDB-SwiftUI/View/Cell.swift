//
//  Cell.swift
//  TheMovieDB-SwiftUI
//
//  Created by Ronald Maciel on 07/04/20.
//  Copyright © 2020 Ronald Maciel. All rights reserved.
//

import SwiftUI

struct Cell: View {
    
    var title = ""
    var overview = ""
    var rate = ""
    var image = ""
    
    
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 80, height: 118)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .lineLimit(1)
                    
                    
                    Text(overview)
                        .font(.subheadline)
                        .fontWeight(.thin)
                        .lineLimit(3)
                        .frame(width: 260)
                    
                    
                    HStack {
                        Text("*")
                        Text(rate)
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .frame(width: 35)
                    }
                    .padding(5)
                }
            }.onAppear() {
                
            }
        }//pegar imagem 
    }
}


//struct Cell_Previews: PreviewProvider {
//    static var previews: some View {
//        Cell()
//    }
//}
